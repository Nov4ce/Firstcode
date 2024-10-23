// JOHNAS J BAUTISTA // SELECTION MAIN MENU 1 - WITHOUT FUNCTIONS

#include <iostream>
#include <conio.h>
#include <iomanip>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

int main()
{
   int choice;
     do{
	cout<<endl<<"============="<<endl;
	cout<<"[Main Menu]"<<endl;
	cout<<"============="<<endl;
	cout<<"1 - To identify whether the inputted number is Positive, Negative or Neutral."<<endl;
	cout<<"2 - To identify whether the inputted number is Odd or Even."<<endl;
	cout<<"3 - To identify the largest among 3 numbers."<<endl;
	cout<<"4 - To identify the largest between 2 numbers."<<endl;
	cout<<"5 - To identify whether the inputted number is prime or not."<<endl;
	cout<<"6 - To compute for the average of Prelim, Midterm and Finals."<<endl;
	cout<<"7 - To find the equivalent grade of the average."<<endl;
	cout<<"8 - To compute the commission of the salesman."<<endl;
	cout<<"9 - To identify whether the inputted letter is Vowel or Consonant."<<endl;
	cout<<"10 - Exit"<<endl;
	cout<<"Enter Your Choice: ";
	cin>>choice;

	switch(choice)
	{
	    case 1:
		{
		int num, Positive, Negative, Neutral;

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 1"<<endl;
		cout<<"=============================="<<endl;
		cout << "Enter Number: ";
		cin>>num;
		cout<<"-----------------------------------------------------"<<endl;

		if (num==0)
		    cout<<"Neutral"<<endl;
		else if (num>0)
		    cout<<"Positive"<<endl;
		else
		    cout<<"Negative"<<endl;
		}
		break;

	    case 2:
		{
		int number, odd, even;

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 2"<<endl;
		cout<<"=============================="<<endl;
		cout << "Enter Number: ";
		cin>>number;
		cout<<"-----------------------------------------------------"<<endl;

		if (number%2==0)
			cout <<"Even"<<endl;
		else
		     cout <<"Odd"<<endl;
		}
		break;

	    case 3: 
		{
		int num1, num2, num3;

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 3"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Enter num1: ";
		cin>>num1;
		cout<<"Enter num2: ";
		cin>>num2;
		cout<<"Enter num3: ";
		cin>>num3;
		cout<<"-----------------------------------------------------"<<endl;

		if (num1>num2)
		    {
			if (num1>num3)
			cout<<"The Largest number is"<<" "<<num1<<endl;

			else
			cout<<"The Largest number is"<<" "<<num3<<endl;
		    }
		else
		    {
			if(num2<num3)
			cout<<"The Largest number is"<<" "<<num3<<endl;

			else
			cout<<"The Largest number is"<<" "<<num2<<endl;
		    }
		}
		break;

	    case 4:
		{
		int n1, n2;

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 4"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Enter num1: ";
		cin>>n1;
		cout<<"Enter num2: ";
		cin>>n2;
		cout<<"-----------------------------------------------------"<<endl;

		if (n1>n2)
		    cout<<"The Largest number is"<<" "<<n1;

		else
		    cout<<"The Largest number is"<<" "<<n2;
		}
		break;

	    case 5:
		{
		int numb, i=2;
		bool value = false;
		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 5"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Input a number: ";
		cin>>numb;
		cout<<"-----------------------------------------------------"<<endl;

		
		for (i = 2; i+i <= numb; i++)
		{
			if (numb % i == 0) {
				value = true;
				break;
			}
		}
		    if (!value)
			cout<<"Prime";
		    else
			cout<<"Not Prime";

		}
		break;

	    case 6:
		{
		float average, prelim, midterm, finals;
		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 6"<<endl;
		cout<<"=============================="<<endl;

		cout<<"Prelim: ";
		cin>>prelim;

		cout<<"Midterm: ";
		cin>>midterm;

		cout<<"Finals: ";
		cin>>finals;
		cout<<"-----------------------------------------------------"<<endl;

		average = (prelim + midterm + finals)/3;

		cout<<"Average: "<<average<<endl;

		if (average>75)
		    cout<<"Passed";

		else
		    cout<<"Failed";
		}
		break;

		case 7:
		{
			float ave;
		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 7"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Input your average: ";
		cin>>ave;
		cout<<"-----------------------------------------------------"<<endl;

		if (ave >= 97 && ave <=100)
			cout<<"1.0 - Pass";
		else if (ave >= 94)
			cout<<"1.25 - Pass";
		else if (ave >= 91)
			cout<<"1.50 - Pass";
		else if (ave >= 88)
			cout<<"1.75 - Pass";
		else if (ave >= 85)
			cout<<"2.0 - Pass";
		else if (ave >= 82)
			cout<<"2.25 - Pass";
		else if (ave >= 79)
			cout<<"2.50 - Pass";
		else if (ave >= 76)
			cout<<"2.75 - Pass";
		else if (ave == 75)
			cout<<"3.0 - Pass";
		else
			cout<<"5.0 - Fail";
		}
		break;

	    case 8:
		{
		float UnitPrice, salesmanNumber, UnitSold, TotalSales, commission;
		char salesmanName [50];

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 8"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Salesman Number: ";
		cin>>salesmanNumber;
		cout<<"Salesman Name: ";
		cin>>salesmanName;
		cout<<"Unit Sold: ";
		cin>>UnitSold;
		cout<<"UnitPrice: ";
		cin>>UnitPrice;
		cout<<"-----------------------------------------------------"<<endl;

		TotalSales = UnitSold * UnitPrice;

		if (TotalSales<=10000)
		{
		    commission = TotalSales * 0.1;
		    cout<<"Commission: "<<commission<<endl;
		}
		else if (TotalSales<=15000)
		{
		    commission = TotalSales * 0.15;
		    cout<<"Commission: "<<commission<<endl;
		}
		else if (TotalSales>=20000)
		{
		    commission = TotalSales * 0.2;
		    cout<<"Commission: "<<commission<<endl;
		}
		else
		{
		    commission = TotalSales * 0.3;
		    cout<<"Commission: "<<commission<<endl;
		}
		}
		break;

	    case 9:
		{
		char letter, vowel, consonant;

		cout<<"=============================="<<endl;
		cout<<setw(19)<<"Problem 9"<<endl;
		cout<<"=============================="<<endl;
		cout<<"Enter a Letter: ";
		cin>>letter;
		cout<<"-----------------------------------------------------"<<endl;

		if (letter == 'a' || letter == 'A')
		    cout<<"The Inputted Letter is Vowel"<<endl;

		else if (letter == 'e' || letter == 'E')
		    cout<<"The Inputted Letter is Vowel"<<endl;

		else if (letter == 'i' || letter == 'I')
		    cout<<"The Inputted Letter is Vowel"<<endl;

		else if (letter == 'o' || letter == 'O')
		    cout<<"The Inputted Letter is Vowel"<<endl;

		else if (letter == 'u' || letter == 'U')
		    cout<<"The Inputted Letter is Vowel"<<endl;

		else
		    cout<<"The Inputted Letter is Consonant"<<endl;
		}
		break;

	    case 10:
		exit(0);

	    default:
		cout<<"Error"<<endl;
	}

     }while(choice<11);

   return 0;
	 
}

