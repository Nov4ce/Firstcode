#include <iostream> // For inputs, outputs and other necessary functions needed
#include <windows.h> // For cursor positioning and box
#include <conio.h>
#include <string>
#include <ctime>
#include <fstream>


void gotoxy(short x, short y){
	COORD c = { x, y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);
}


void Box(int x1, int x2, int y1, int y2){
	int temp = 0;
	temp += x1;
	for(x1; x1 <= x2; x1++){
		gotoxy(static_cast<short>(x1), static_cast<short>(y1)); std::cout << '*';
		gotoxy(static_cast<short>(x1), static_cast<short>(y2)); std::cout << '*';
	}
	x1 = temp;
	for(y1; y1 <= y2; y1++){
		gotoxy(static_cast<short>(x1), static_cast<short>(y1)); std::cout << '*';
		gotoxy(static_cast<short>(x2), static_cast<short>(y1)); std::cout << '*';
	}
}

std::string choices[] = {
	"1 - People",
	"2 - Timeline",
	"3 - Mactan Battle",
	"4 - 5 Ships",
	"5 - Treaty of Tordesillas",
	"6 - Philippine First Mass",
	"7 - Locations where they docked",
	"8 - Pacific Ocean",
	"9 - Goal of the expedition",
	"10 - Feedback",
	"11 - About the program",
	"12 - Exit"
};

std::string Person[] = {
	"1 - Magellan",
	"2 - Lapu-Lapu",
	"3 - Pigafetta",
	"4 - Malacca",
	"5 - Humabon",
	"6 - Siaui & Colambu",
	"7 - Exit"
};

std::string Timeline[] = {
	"1 - March 16, 1521",
	"2 - March 17, 1521",
	"3 - March 18, 1521",
	"4 - March 27, 1521",
	"5 - March 29, 1521",
	"6 - March 31, 1521",
	"7 - April 4, 1521",
	"8 - April 7, 1521",
	"9 - April 27, 1521",
	"10 - May 2, 1521",
	"11 - Sept 30, 1521",
	"12 - Oct 7, 1521",
	"13 - Oct 27, 1521",
	"14 - Exit"
};


void set_of_choice(std::string choices[], int size)
{
	Box(4, 58, 2, 21);
	Box(2, 60, 1, 22);
	int y_point = 7;
	for (int i = 0; i < size; i++)
	{
		gotoxy(20, (i+7)); std::cout << choices[i] << std::endl;
		y_point++;
	}
	gotoxy(20, (y_point)); std::cout << "Enter Your Choice: ";
	
}

void Loading(){
	char symbols[] = {'-', '\\', '|', '/'};
	srand(time(0));
	int result = rand() % 4 + 1;
	for(int i = 0; i < result; i++){
		for(int j = 0; j < 4; j++){
			gotoxy(25, 23); std::cout << "Loading " << symbols[j] << '\r' << std::endl;
			Sleep(300);
		}
	}
	gotoxy(25, 23); std::cout << " " << std::endl;

}

void open_file(const std::string filename){
	int length = 0, i = 4;
	int y_length = 0;
	std::string line;
	std::ifstream myFile;
	myFile.open(filename, std::ios::in);
	if (myFile.is_open())
	{
		while(std::getline(myFile, line))
		{
			if(line.length() > length)
			length = line.length();
			y_length++;
		}
	} else {
		gotoxy(21, 23); std::cout << "File did not open" << std::endl;
	}
	myFile.close();
	
	myFile.open(filename, std::ios::in);
	if(myFile.is_open())
	{
		Box(64, length + 69, 2, y_length + 5);
		Box(62, length + 71, 1, y_length + 6);
		while(std::getline(myFile, line))
		{
			gotoxy(67 + ((length - line.length()) / 2), i); std::cout << line << std::endl;
			i++;
		}
	} else {
		gotoxy(21, 23); std::cout << "File did not open" << std::endl;
	}
	myFile.close();
}


int main()
{
	system("cls");
	std::string User_name;
	int choice;
	std::cout<<"Enter Your Name: ";
	std::cin>>User_name;
	Loading();
	const std::string Basic_file[] = {
		"Battle_of_Mactan.txt",
		"Ships.txt", 
		"Treaty.txt",
		"First_Mass.txt",
		"Location.txt",
		"Pacific.txt",
		"Expedition.txt",
		"About.txt"
	};

	system("cls");
	do{
		gotoxy(11, 4); std::cout << "Beyond the Horizon: Magellan's Journey" << std::endl;
		gotoxy(((58 - (8 + User_name.length())) / 2) + 2, 5); std::cout << "Welcome " << User_name << std::endl;
		set_of_choice(choices, sizeof(choices)/sizeof(choices[0]));
		std::cin>>choice;
		switch(choice)
		{
			case 1: 
				break;
				
			case 2:
				break;
				
			case 3:
				open_file(Basic_file[0]);
				break;
				
			case 4:
				break;
				
			case 5:
				break;
				
			case 6:
				break;
				
			case 7:
				break;
				
			case 8:
				break;
				
			case 9:
				break;
				
			case 10:
				break;
				
			case 11:
				break;
				
			case 12:
				break;
				
			default:
				gotoxy(7, 20); std::cout << "Invalid Choice" << std::endl; 
				getch();
		}		
	}while(choice != 12);
	system("cls");
	Box(4, 58, 2, 21);
	Box(2, 60, 1, 22);
	gotoxy((60 - 22) / 2, 12); std::cout << "Thank you for visiting" << "\n\n\n\n\n\n\n\n\n\n\n\n\n" << std::endl;
	getch();
	return 0;
}
