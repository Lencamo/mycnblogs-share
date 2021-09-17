~~~java
package Snake;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Random;

//this: 指向当前的类，类需要作为【鼠标监听事件】接口的实现类
public class Mpanel extends JPanel implements KeyListener, ActionListener {

    public Mpanel() {
        initDate(); //初始化蛇长、食物数据

        //获取焦点(键盘事件)、处理(监听)事件
        this.setFocusable(true);
        this.addKeyListener(this);

        //启动时钟
        timer.start();
    }

    public void initDate() {
        len = 3; //最开始有三个身体
        snakex[0] = 100;  //right头部
        snakey[0] = 100;

        snakex[1] = 75;   //body部分
        snakey[1] = 100;

        snakex[2] = 50;   //body部分
        snakey[2] = 100;

        dir = "R";
        score = 0;

        //随机产生食物的位置
        foodx = 25 + 25*rand.nextInt(34);  //900 = 25 + 34*25 + 25
        foody = 75 + 25*rand.nextInt(24);  //700 = 75 + 24*25 + 25
    }

    //蛇的身体长度设置
    int len = 3;
    int [] snakex = new int[1000];
    int [] snakey = new int[1000];

    //蛇的R,L,U,D头部方向设置
    String dir = "R";

    //开始提示
    Boolean isStarted = false;
    //结束提示
    Boolean isFailed = false;

    //蛇位置变化时间
    Timer timer = new Timer(111,this);  //每次变化多少毫秒

    //食物的随机产生
    int foodx;
    int foody;
    Random rand = new Random();

    //实现记录分数功能
    int score = 0;

    //重写KeyListener接口方法
    @Override
    public void keyTyped(KeyEvent e) {   //准备敲

    }

    @Override
    public void keyPressed(KeyEvent e) {  //敲的过程
        int keyCode = e.getKeyCode(); //获得键盘上按键对应的编码数字
        if(keyCode == KeyEvent.VK_SPACE) {//VK_SPACE ==32 即空格键
            if(isFailed) {
                isFailed = false;
                initDate();
            }else {
                isStarted = !isStarted;
            }
            repaint();  //新的数据状态
        }else if(keyCode == KeyEvent.VK_LEFT) {  //定义键盘按键与蛇头部事件
            dir = "L";
        }else if(keyCode == KeyEvent.VK_RIGHT) {  //定义键盘按键与蛇头部事件
            dir = "R";
        }else if(keyCode == KeyEvent.VK_UP) {  //定义键盘按键与蛇头部事件
            dir = "U";
        }else if(keyCode == KeyEvent.VK_DOWN) {  //定义键盘按键与蛇头部事件
            dir = "D";
        }
    }

    @Override
    public void keyReleased(KeyEvent e) { //结束

    }

    //重写ActionListener时间接口方法
    @Override
    public void actionPerformed(ActionEvent e) {
        if(isStarted && !isFailed) {
            //身体移动(i>0：表示i=0时的头部不包括）
            for(int i=len-1;i>0;i--) {
                snakex[i] = snakex[i-1];
                snakey[i] = snakey[i-1];
            }
            //头部移动（点明i=0：表示头部）
            if(dir == "R"){
                snakex[0] = snakex[0] + 25;
                //设置移动边界
                if(snakex[0] >= 900-25){
                    snakex[0] = snakex[0] - 25;
                    isFailed = true;
                }
            }else if(dir == "L"){
                snakex[0] = snakex[0] - 25;
                //设置移动边界
                if(snakex[0] <= 0){
                    snakex[0] = snakex[0] + 25;
                    isFailed = true;
                }
            }else if(dir == "U"){
                snakey[0] = snakey[0] - 25;
                //设置移动边界
                if(snakey[0] < 75){
                    snakey[0] = snakey[0] + 25;
                    isFailed = true;
                }
            }else if(dir == "D"){
                snakey[0] = snakey[0] + 25;
                //设置移动边界
                if(snakey[0] >= 700-25){
                    //snakey[0] = 75;
                    snakey[0] = snakey[0] - 25;
                    isFailed = true;
                }
            }

            //判断蛇与食物是否重叠
            if(snakex[0] == foodx && snakey[0] ==foody) {
                len++;
                score = score +10;
                //重新随机产生食物
                foodx = 25 + 25*rand.nextInt(34);
                foody = 75 + 25*rand.nextInt(24);
            }

            //判断是否结束游戏
            for(int i=1;i<len;i++) {
                if(snakex[i]==snakex[0] && snakey[i]==snakey[0]) {
                    isFailed = true;
                }
            }

            repaint();  //新的数据状态
        }

        timer.start();  //新的时间
    }

    //创建图像/图标类对象
    ImageIcon title = new ImageIcon("title.jpg");
    ImageIcon body = new ImageIcon("body.png");
    ImageIcon up = new ImageIcon("up.png");
    ImageIcon down = new ImageIcon("down.png");
    ImageIcon left = new ImageIcon("left.png");
    ImageIcon right = new ImageIcon("right.png");
    ImageIcon food = new ImageIcon("food.png");


    //JComponent【组件类】方法
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        this.setBackground(Color.GRAY);

        //调用图像类方法
        title.paintIcon(this,g,25,11);

        //调用Graphics画笔类方法
        //(填充)
        g.fillRect(25,75,900-50,700-75-25);

        //(显示积分)
        g.setColor(Color.WHITE);
        g.setFont(new Font("arial",Font.BOLD,20));
        g.drawString("Len:" + len,750,32);
        g.drawString("Sore:" + score,750,55);

        //(开始提示)
        if(isStarted == false) {
            g.setColor(Color.WHITE);
            g.setFont(new Font("arial", Font.BOLD, 40));
            g.drawString("Press Space to Start or pause", 200, 300);
        }

        //(结束提示)
        if(isFailed) {
            g.setColor(Color.RED);
            g.setFont(new Font("arial", Font.BOLD, 40));
            g.drawString("Press Space to Rstart", 250, 300);
        }

        //调用图标类方法  😭【❤必须放在Graphics类后面，才能将图片显示在黑色区域❤】
/*      right.paintIcon(this,g,100,100);
        body.paintIcon(this,g,75,100);     当蛇身变长后复杂
        body.paintIcon(this,g,50,100);
*/
        if(dir == "R") {                                         //显示right头部
            right.paintIcon(this,g,snakex[0],snakey[0]);
        }else if(dir == "L") {
            left.paintIcon(this,g,snakex[0],snakey[0]);
        }else if(dir == "D") {
            down.paintIcon(this,g,snakex[0],snakey[0]);
        }else if(dir == "U") {
            up.paintIcon(this,g,snakex[0],snakey[0]);
        }

        for(int i=1;i<len;i++) {                                  //显示body部分
            body.paintIcon(this,g,snakex[i],snakey[i]);
        }

        food.paintIcon(this,g,foodx,foody);                    //显示food部分
    }
}

~~~

