~~~java
package Snake;

import javax.swing.*;
import java.awt.*;

public class Msnake {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Lencamo's 贪吃蛇 program");
        frame.setBounds(10,10,915,720); //大小和位置
        //---------------------------------

        Mpanel Lencamo = new Mpanel();
        frame.add(Lencamo);

        frame.setResizable(false); //大小不能变
        frame.setVisible(true); //设为组件可见窗口,😭【❤必须放在.add()后❤】
        //frame.getContentPane().setBackground(Color.RED);
        frame.setBackground(new Color(49, 121, 74));

        //----------------------------------
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //点×的时候，JVM随之关闭

    }
}

~~~

