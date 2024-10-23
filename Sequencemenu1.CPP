// JOHNAS J BAUTISTA // MAINMENU
#include<iostream>
#include<cmath>
using namespace std;

int main()
{
    int choice;
    do{
		
	cout<<endl<<"Main Menu"<<endl;
	cout<<"1 - Problem 1"<<endl;
	cout<<"2 - Problem 2"<<endl;
	cout<<"3 - Problem 3"<<endl;
	cout<<"4 - Problem 4"<<endl;
	cout<<"5 - Problem 5"<<endl;
	cout<<"6 - Problem 6"<<endl;
	cout<<"7 - Problem 7"<<endl;
	cout<<"8 - Problem 8"<<endl;
	cout<<"9 - Problem 9"<<endl;
	cout<<"10 - Problem 10"<<endl;
	cout<<"11 - Problem 11"<<endl;
	cout<<"12 - Problem 12"<<endl;
	cout<<"13 - Exit"<<endl;
	cout<<"Enter your choice : ";
	cin>>choice;

	switch(choice) {

	case 1:
	    int n1, n2, n3, n4;
	    double average,total;


		cout<<"Problem 1"<<endl;
		cout<<"Compute the total and average of four numbers :"<<endl;
		cout<<"-------------------------------------"<<endl;
		cout<<"Input 1st two numbers (seperated by space) :"<<" ";
		cin>>n1>>n2;
		cout<<"Input last two numbers (seperated by space) :"<<" ";
		cin>>n3>>n4;

		total = n1 + n2 + n3 + n4;
		average =total/4;

		cout<<"The total of four numbers is :"<<" "<<total<<endl;
		cout<<"The average of four number is :"<<" "<<average<<endl;
		
		break;

	case 2:
	    float quotient, remainder;
	    int divisor, dividend;

	
		cout<<"Problem 2"<<endl;
		cout<<"Compute the quotient and remainder :"<<endl;
		cout<<"----------------------------"<<endl;
		cout<<"Input the dividend : ";
		cin>>dividend;
		cout<<"Input the divisor : ";
		cin>>divisor;

		quotient = dividend / divisor;
		remainder = dividend % divisor;

		cout<<"The quotient of the division is :"<<" "<<quotient<<endl;
		cout<<"The remainder of the division is :"<<" "<<remainder<<endl;


		break;

	case 3:
	    float a,b,c,root1,root2;
	
		cout<<"Problem 3"<<endl;
		cout<<"Compute the roots of quadratic equation :"<<endl;
		cout<<"--------------------------------"<<endl;
		cout<<"Enter the value for a : ";
		cin>>a;
		cout<<"Enter the value for b : ";
		cin>>b;
		cout<<"Enter the value for c : ";
		cin>>c;

		root1 = (-b + sqrt((b*b)-4*a*c))/2*a;
		root2 = (-b - sqrt((b*b)-4*a*c))/2*a;

		cout<<"The 1st root of the quadratic equation is : "<<root1<<endl;
		cout<<"The 2md root of the quadratic equation is : "<<root2<<endl;


		break;

	case 4:
	    int number, square, cube;

		cout<<"Problem 4"<<endl;
		cout<<"Compute the square and cube of a number :"<<endl;
		cout<<"--------------------------------"<<endl;
		cout<<"Input a number : ";
		cin>>number;

		square = number*number;
		cube = number*number*number;

		cout<<"The square of a number is : "<<square<<endl;
		cout<<"The cube of a number is : "<<cube<<endl;

	
		break;

	case 5:
	    int length, width, area, perimeter;

		cout<<"Problem 5"<<endl;
		cout<<"Compute the area and perimeter of rectangle"<<endl;
		cout<<"--------------------------------"<<endl;
		cout<<"Enter the Length : ";
		cin>>length;
		cout<<"Enter the Width : ";
		cin>>width;

		area = length*width;
		perimeter = (2*length)+(2*width);

		cout<<"The area of the rectangle is : "<<area<<endl;
		cout<<"The perimeter of the rectangle is : "<<perimeter<<endl;


		break;

	case 6:
	    int var1, var2, var3;


		cout<<"Problem 6"<<endl;
		cout<<"Compute by swapping two variables : "<<endl;
		cout<<"--------------------------------"<<endl;
		cout<<"Enter the value of variable 1 : ";
		cin>>var1;
		cout<<"Enter the value of variable 2 : ";
		cin>>var2;

		var3 = var1;
		var1 = var2;
		var2 = var3;

		cout<<"The swapped value of variable 1 is : "<<var1<<endl;
		cout<<"The swapped value of variable 2 is : "<<var2<<endl;


		break;

	case 7:
	    int EmpNumb, NumOfhrs,Rateperhrs;
	    char employeename[50];
	    float grosspay, netpay;

		cout<<"Problem 7"<<endl;
		cout<<"Compute for the gross pay and net pay of an employee:"<<endl;
		cout<<"--------------------------------"<<endl;
		cout<<"Employee Number : ";
		cin>>EmpNumb;
		cout<<"Employee Name : ";
		cin>>employeename;
		cout<<"Number of hours : ";
		cin>>NumOfhrs;
		cout<<"Rate per hours : ";
		cin>>Rateperhrs;

		grosspay = NumOfhrs * Rateperhrs;
		netpay = grosspay - (grosspay*0.1);

		cout<<"The gross pay of an employee is : "<<grosspay<<endl;
		cout<<"The net pay of an employee is : "<<netpay<<endl;


		break;

	case 8:
	    float num1, num2, sum, diff, product, quot;

	
		cout<<"Problem 8"<<endl;
		cout<<"Compute the sum, difference, product and quotient of the two number :"<<endl;
		cout<<"----------------------------------"<<endl;
		cout<<"Enter the value of number 1 : ";
		cin>>num1;
		cout<<"Enter the value of number 2 : ";
		cin>>num2;

		sum = num1 + num2;
		diff = num1 - num2;
		product = num1 * num2;
		quot = num1 / num2;

		cout<<"The sum of two number is : "<<sum<<endl;
		cout<<"The difference of two number is : "<<diff<<endl;
		cout<<"The product of two number is : "<<product<<endl;
		cout<<"The quotient of two number is : "<<quot<<endl;


		break;

	case 9:
	    int diameter;
	    float ar, circ;


		cout<<"Problem 9"<<endl;
		cout<<"Compute the area and circumference of a circle :"<<endl;
		cout<<"----------------------------------"<<endl;
		cout<<"Enter diameter of a circle : ";
		cin>>diameter;

		ar = 0.25 * 3.1416 * diameter * diameter;
		circ = 2 * 3.1416 * diameter / 2;

		cout<<"The area of a cicle is : "<<ar<<endl;
		cout<<"The circumference of a circle is : "<<circ<<endl;


		break;

	case 10:
	    float celsius, fahrenheit;

	
		cout<<"Problem 10"<<endl;
		cout<<"Compute by converting celsius to fahrenheit : "<<endl;
		cout<<"----------------------------------"<<endl;
		cout<<"Input celsius : ";
		cin>>celsius;

		fahrenheit = celsius * 1.8 + 32;

		cout<<"The value of fahrenheit is : "<<fahrenheit<<endl;

	
		break;

	case 11:
	    char salesmanName[100];
	    int salesmanNumber, unitSold, unitPrice, totalSales;

	
		cout<<"Problem 11"<<endl;
		cout<<"Compute the total sales of salesman : "<<endl;
		cout<<"----------------------------------"<<endl;
		cout<<"Salesman Number : ";
		cin>>salesmanNumber;
		cout<<"Salesman Name : ";
		cin>>salesmanName;
		cout<<"Unit Sold : ";
		cin>>unitSold;
		cout<<"Unit Price : ";
		cin>>unitPrice;

		totalSales = unitSold * unitPrice;

		cout<<"The total sales of salesman is : "<<totalSales<<endl;


		break;

	case 12:
	    int on, taoo, at, ch;
	
		cout<<"Problem 12"<<endl;
		cout<<"Compute the change of order : "<<endl;
		cout<<"----------------------------------"<<endl;
		cout<<"Order Number : ";
		cin>>on;
		cout<<"Amount Tender : ";
		cin>>at;
		cout<<"Total Amount of Order : ";
		cin>>taoo;

		ch = at - taoo;

		cout<<"The total change of order is : "<<ch<<endl;
	
		break;

	case 13:
		exit(0);

	}


    } while(choice<13);

  
    return 0;
}
