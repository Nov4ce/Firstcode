// JOHNAS J. BAUTISTA JR. - LOOPING - MAINMENU - WITHOUT FUNCTIONS //
#include <iostream>
#include <conio.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

void gotoxy (short x, short y)
{
    COORD c = {x,y};
    SetConsoleCursorPosition(  GetStdHandle(STD_OUTPUT_HANDLE) , c);
}

int main()
{
    int choice;
    do{
        system("cls");
        for (int k = 70; k <= 163; k++){
            gotoxy (k,12);
            cout<<"*";
        }
        for (int l = 70; l <=163; l++){
            gotoxy (l,32);
            cout<<"*";
        }
        for (int m = 13; m <=31; m++){
            gotoxy (70,m);
            cout<<"||";
        }
        for (int h = 13; h <=31; h++){
            gotoxy (162,h);
            cout<<"||";
        }
    gotoxy(80.5,14);cout<<"==========================================================================";
    gotoxy(113.5,15);cout<<"Main Menu";
    gotoxy(80.5,16);cout<<"==========================================================================";
    gotoxy(80,17);cout<<"1 - Printing Numbers From 1 - 10.";
    gotoxy(80,18);cout<<"2 - Input for the value of N then print all even number numbers from 1 to N.";
    gotoxy(80,19);cout<<"3 - Input for a number then compute and display its factorial ";
    gotoxy(80,20);cout<<"4 - Input for the value of N and display the N fibonacci series";
    gotoxy(80,21);cout<<"5 - Input a number and then display the reverse of the number";
    gotoxy(80,22);cout<<"6 - Input a word and then identify whether the word is palindrome or not";
    gotoxy(80,23);cout<<"7 - Input a decimal that will convert into binary (division by 2)";
    gotoxy(80,24);cout<<"8 - Input for the value of N and then get the sum of all even numbers from 1"; 
    gotoxy(84,25);cout<<" to N";
    gotoxy(80,26);cout<<"9 - Input a value for N and M, then get the sum of the square of all even ";
    gotoxy(84,27);cout<<"numbers from N to M. N must be less than M";
    gotoxy(80,28);cout<<"10 - A program that will input alphabets from A - Z";
    gotoxy(80,29);cout<<"11 - Exit";
    gotoxy(109,30);cout<<"Enter Your Choice: ";
    cin>>choice;

      switch(choice)
      {
        case 1: 
        {   // Print numbers from 1 to 10
                system("cls");
                for(int num = 1; num<=10; num++){
                    cout<<num<<" ";
                }
        }getch();
        system("pause");
        break;

        case 2: 
        {  //  Input for the value of N then print all even number numbers from 1 to N.
            system("cls");
             int N, i = 1;
                cout<<"Input a number to N: ";
                cin>>N;
                while(2 * i <= N){
                    cout<< 2 * i<<" ";
                    i++;
                }
        }getch();
        system("pause");
        break;

        case 3: 
        {   // Input for a number then compute and display its factorial // 5! = 5*4*3*2*1
            system("cls");
            int num, factorial = 1; 
                cout<<"Input a number: ";
                cin>>num;
                int i = num;
                do{
                    factorial = factorial * i;
                    i--;
                }while( i >= 1); 
                    cout<<num<<"! is "<<factorial;
        }getch();
        system("pause");
        break;
        
        case 4:
        {   // Input for the value of N and display the N fibonacci series.
            system("cls");
            int i = 1, var1 = 0, var2 = 1, var3 = 0, N;
            cout<<"Put a number in N: ";
            cin>>N;
            do{
                cout<<var1<<" "; 
                var3 = var1 + var2;
                var1 = var2;
                var2 = var3;
                i++;
            }while(i<=N);
        }getch();
        break;  

        case 5:
        {   // Input a number and then display the reverse of the number.
            system("cls");
            int N, remainder, rev = 0;
            cout<<"Enter a Number: ";
            cin>>N;
            while(N>0)
            {
                remainder = N % 10;
                rev = rev * 10 + remainder;
                N = N / 10 ;
            }
            cout<<"The reverse of a number you entered is "<<rev;
        }getch();
        system("pause");
        break;

        case 6:
        {   // Input a word and then identify whether the word is palindrome or not. 
            system("cls");
            string word;
            int length;
            bool isPalindrome = true;
            cout<<"Enter a word: ";
            cin>>word;

            length = word.length();

            for(int i = 0; i < (length/2); i++)
            {
                if (word[i] != word[(length - 1) - i])
                    isPalindrome = false;
            }
            if (isPalindrome == true)
                cout<<word<<" is a palindrome"<<endl;

            else
                cout<<word<<" is not a palindrome"<<endl;
        }getch();
        system("pause");
        break;

        case 7:
        {   // Input a decimal that will convert into binary (division by 2)
            system("cls");
            int decimal, binary = 0, temp = 1;
                
            cout << "Enter a decimal number: ";
            cin >> decimal;
                
            while (decimal > 0) {
                binary = binary + (decimal % 2) * temp;
                decimal = decimal / 2;
                temp = temp * 10;
            }
                
            cout << "The binary equivalent is " << binary << endl;
        }getch();
        system("pause");
        break;

        case 8:
        {   // Input for the value of N and then get the sum of all even numbers from 1 to N.
            system("cls");
            int n, sum = 0;
            
            cout << "Enter a value for N: ";
            cin >> n;
            
            for (int i = 2; i <= n; i += 2) {
                sum = sum + i;
            }
            cout << "The sum of all even numbers from 1 to " << n << " is " << sum << endl;
        }getch();
        system("pause");
        break;

        case 9:
        {   // Input a value for N and M, then get the sum of the square of all even numbers from N to M. N must be less than M.
            system("cls");
            int N, M, sum = 0, square = 0;
            cout<<"Input a value to N: ";
            cin>>N;
            cout<<"Input a value to M: ";
            cin>>M;
            
            if (N>M){
                cout<<"Error: The value of N must be less than M";
            }
            else {
                for(int i = N; i <= M; i++)
                {
                    if(i % 2 == 0)
                    {
                        square = i * i;
                        sum = sum + square;
                    }
                }
                cout<<"The sum of the squares of even numbers from "<<N<< " to "<<M<< " is "<<sum;
            } 
        }getch();
        system("pause");
        break;

        case 10:
        {   // A program that will input alphabets from A - Z
            system("cls");
            for(char letter = 'A'; letter <= 'Z'; letter++)
                cout<<letter<<" ";
        }getch();
        system("pause");
        break;

        case 11: 
            exit(0);

        default:{
            system("cls");
            cout<<"Error";}
            system("pause");
      }
    }while(choice<12);
return 0;
}