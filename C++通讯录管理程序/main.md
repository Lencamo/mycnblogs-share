~~~c++
//项目流程：
//    ①菜单界面  ——>  ②相应功能的进入和退出   ——>  ③添加联系人功能的实现
//   ——>  ④显示联系人功能的实现    ——>  ⑤删除联系人功能的实现
//   ——>  ⑥查找联系人功能的实现    ——>  ⑦修改联系人功能的实现
//   ——>  ⑧清空联系人功能的实现


//头文件
#include <iostream>
using namespace std;
#include <string>
#define MAX 1000


//①显示初始菜单界面(showMenu)
void showMenu()
{
	cout << "		                                     " << endl;
	cout << "        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" << endl;
	cout << "        ^^     《通讯录管理系统》         ^^" << endl;
	cout << "        ^^                                ^^" << endl;
	cout << "        ^^  ---|    1、添加联系人         ^^" << endl;
	cout << "        ^^  ---|    2、显示联系人         ^^" << endl;
	cout << "        ^^  ---|    3、删除联系人         ^^" << endl;
	cout << "        ^^  ---|    4、查找联系人         ^^" << endl;
	cout << "        ^^  ---|    5、修改联系人         ^^" << endl;
	cout << "        ^^  ---|    6、清空联系人         ^^" << endl;
	cout << "        ^^  ---|    0、退出通讯录         ^^" << endl;
	cout << "        ^^================================^^" << endl;
	cout << "        ^^设计人：     Lencamo xxxx.xx.xx ^^" << endl;
	cout << "        ^^================================^^" << endl;
	cout << "        ^^                                ^^" << endl;
	cout << "        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" << endl;
	cout << "		                                     " << endl;
	cout << "		                                     " << endl;
	cout << "请输入(1-6)进入对应功能：		             " << endl;

}



//③添加联系人功能
		//3.1定义一个包含联系人信息的结构体Person
struct Person
{
	string m_Name; //姓名
	int m_Sex; //性别 【1 男  |   2 女 】  (定义为int：防止用户输入其他内容）
	int  m_Age; //年龄
	string m_Phone; //电话
	string m_Mail; //邮箱
	string m_QQ; //QQ号码
	string m_Company;//单位地址
};


//3.2定义一个记录联系人个数的容器结构体Addressbooks
struct Contactbooks
{
	//保存联系人的数组
	struct Person personArray[MAX];  //(即Addressbooks结构体 内嵌了 Person结构体）
	//记录联系人的个数
	int m_Size;
};


//3.3地址传递方式的用来接收的添加联系人功能的函数
void addPerson(Contactbooks* abs)  //指针接收地址
{
	//添加联系人条件
	if (abs->m_Size == MAX)
	{
		cout << "通讯录人数已经达到上限" << endl;
		return;
	}
	//正式添加联系人
	else
	{
		//姓名
		string name;
		cout << "请输入姓名" << endl;
		cin >> name;
		abs->personArray[abs->m_Size].m_Name = name; //(添加__.m_Name的同时记录为第几个数组)


		//性别
		cout << "请输入性别：" << endl;
		cout << "1 -- 男" << endl;
		cout << "2 -- 女" << endl;
		int sex = 0;

		while (true) //完成添加联系人性别的条件
		{
			cin >> sex;
			if (sex == 1 || sex == 2)
			{
				abs->personArray[abs->m_Size].m_Sex = sex;
				break;
			}
			cout << "请输入1或2" << endl;
		}


		//年龄
		cout << "请输入年龄" << endl;
		int age = 1;
		while (true) //完成添加联系人年龄的条件
		{
			cin >> age;
			if (age >= 1 && age < 140)
			{
				abs->personArray[abs->m_Size].m_Age = age;
				break;
			}
			cout << "请输入合理的年龄" << endl;
		}


		//电话
		cout << "请输入联系电话：" << endl;
		string phone;
		cin >> phone;
		abs->personArray[abs->m_Size].m_Phone = phone;

		//邮箱
		cout << "请输入邮箱地址：" << endl;
		string mail;
		cin >> mail;
		abs->personArray[abs->m_Size].m_Mail = mail;

		//QQ号码
		cout << "请输入QQ号码：" << endl;
		string qq;
		cin >> qq;
		abs->personArray[abs->m_Size].m_QQ = qq;

		//单位地址
		cout << "请输入单位地址：" << endl;
		string company;
		cin >> company;
		abs->personArray[abs->m_Size].m_Company = company;

		//更新通讯录人数
		abs->m_Size++;

		cout << "添加成功！" << endl;

		//清除显示窗口前面的内容：清爽、不会越来越长
		system("pause");  //按任意键继续
		system("cls");   //清屏操作
	}
}


//④显示联系人功能
			//
void showPerson(Contactbooks* abs)
{
	//显示联系人条件
	if (abs->m_Size == 0)
	{
		cout << "当前记录为空" << endl;
	}
	else
	{
		for (int i = 0; i < abs->m_Size; i++)
		{
			cout << "姓名： " << abs->personArray[i].m_Name << "\t";
			cout << "性别： " << (abs->personArray[i].m_Sex == 1 ? "男" : "女") << "\t";
			cout << "年龄： " << abs->personArray[i].m_Age << "\t";
			cout << "电话： " << abs->personArray[i].m_Phone << "\t";
			cout << "邮箱： " << abs->personArray[i].m_Mail << "\t";
			cout << "QQ号码： " << abs->personArray[i].m_QQ << "\t";
			cout << "单位地址： " << abs->personArray[i].m_Company << endl;
		}
	}

	system("pause");
	system("cls");
}

//⑤删除联系人功能
			//5.1查找是否存在该联系人
int isExist(Contactbooks* abs, string name)
{
	//查询联系人存在条件
	for (int i = 0; i < abs->m_Size; i++)
	{
		if (abs->personArray[i].m_Name == name)
		{
			return i;  //(此数组中的下标)
		}
	}
	return -1;

}

//5.2删除存在的该联系人
void delectPerson(Contactbooks* abs)
{
	cout << "请输入你要删除的联系人姓名" << endl;

	string name;
	cin >> name;

	int ret = isExist(abs, name);   //(即：delectPerson函数 内嵌有 isExist函数）
	//删除联系人条件
	if (ret != -1)
	{
		//逻辑上的覆盖删除
		for (int i = ret; i < abs->m_Size; i++)
		{
			abs->personArray[i] = abs->personArray[i + 1];
		}
		//数据更新
		abs->m_Size--;
		cout << "删除联系人成功！" << endl;
	}
	else
	{
		cout << "查无此人" << endl;
	}

	system("pause");
	system("cls");
}


//⑥查找联系人功能
			//
void findPerson(Contactbooks* abs)
{
	cout << "请输入你要查找的联系人姓名" << endl;
	string name;
	cin >> name;

	int ret = isExist(abs, name);   //(即：findPerson函数 内嵌有 isExist函数）
	//判断
	if (ret != -1)
	{
		cout << "姓名： " << abs->personArray[ret].m_Name << "\t";
		cout << "性别： " << (abs->personArray[ret].m_Sex == 1 ? "男" : "女") << "\t";
		cout << "年龄： " << abs->personArray[ret].m_Age << "\t";
		cout << "电话： " << abs->personArray[ret].m_Phone << "\t";
		cout << "邮箱： " << abs->personArray[ret].m_Mail << "\t";
		cout << "QQ号码： " << abs->personArray[ret].m_QQ << "\t";
		cout << "单位地址： " << abs->personArray[ret].m_Company << endl;
	}
	else
	{
		cout << "查无此人" << endl;
	}

	system("pause");
	system("cls");
}


//⑦修改联系人功能
			//
void modifyPerson(Contactbooks* abs)
{
	cout << "请输入你要修改的联系人姓名" << endl;
	string name;
	cin >> name;

	int ret = isExist(abs, name);   //(即：modifyPerson函数 内嵌有 isExist函数）
	//判断
	if (ret != -1)
	{
		//姓名
		string name;
		cout << "请输入修改后的姓名" << endl;
		cin >> name;
		abs->personArray[ret].m_Name = name;  //（下标为ret的联系人姓名改为指定的姓名name）


		//性别
		cout << "请输入修改后的性别：" << endl;
		cout << "1 -- 男" << endl;
		cout << "2 -- 女" << endl;
		int sex = 0;

		while (true) //完成修改联系人性别的条件
		{
			cin >> sex;
			if (sex == 1 || sex == 2)
			{
				abs->personArray[ret].m_Sex = sex;
				break;
			}
			cout << "请输入1或2" << endl;
		}


		//年龄
		cout << "请输入修改后的年龄" << endl;
		int age = 1;
		while (true) //完成修改联系人年龄的条件
		{
			cin >> age;
			if (age >= 1 && age < 140)
			{
				abs->personArray[ret].m_Age = age;
				break;
			}
			cout << "请输入合理的年龄" << endl;
		}


		//电话
		cout << "请输入修改后的联系电话：" << endl;
		string phone;
		cin >> phone;
		abs->personArray[ret].m_Phone = phone;

		//邮箱
		cout << "请输入修改后的邮箱地址：" << endl;
		string mail;
		cin >> mail;
		abs->personArray[ret].m_Mail = mail;

		//QQ号码
		cout << "请输入修改后的QQ号码：" << endl;
		string qq;
		cin >> qq;
		abs->personArray[ret].m_QQ = qq;

		//地址
		cout << "请输入修改后的单位地址" << endl;
		string company;
		cin >> company;
		abs->personArray[abs->m_Size].m_Company = company;

		//更新通讯录人数
		abs->m_Size++;

		cout << "添加成功！" << endl;
	}
	else
	{
		cout << "查无此人" << endl;
	}

	system("pause");
	system("cls");
}


//⑧清空联系人功能
		  //
void cleanPerson(Contactbooks* abs)
{
	//数量上的逻辑清空
	abs->m_Size = 0;
	cout << "所以联系人已经删除" << endl;

	system("pause");
	system("cls");
}



//main函数
int main() {
	//③通讯录结构体调用
	Contactbooks abs;
	abs.m_Size = 0;    //初始化


	int select = 0;
	//利用case0中 0为假；产生只有case0可以真正的退出系统效果
	while (true)
	{
		//①调用封装好的showMenu函数
		showMenu();

		//②功能调用
		cin >> select;
		switch (select)
		{
		case 1:  //添加联系人
			addPerson(&abs);  //【利用地址传递修饰】 addperson(abs);✗ 值传递不能修饰实参
			break;

		case 2:  //显示联系人
			showPerson(&abs);
			break;

		case 3:  //删除联系人
			delectPerson(&abs);
			break;

		case 4:  //查找联系人
			findPerson(&abs);
			break;

		case 5:  //修改联系人
			modifyPerson(&abs);
			break;

		case 6:  //清空联系人
			cleanPerson(&abs);
			break;

		case 0:  //退出通讯录
			cout << "欢迎下次使用" << endl;
			system("pause");
			return 0;
			break;
		}
	}

	system("pause");
	return 0;
}


~~~

