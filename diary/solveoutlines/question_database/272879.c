#include <stdio.h>

int  main() {
	int year,month,day;
	int cday;
	scanf("%d %d %d",&year,&month,&day);
	switch(month) {
		case 1:
			cday = 0;
			break;
		case 2:
			cday = 31;
			break;
		case 3:
			cday = 31+28;
			break;
		case 4:
			cday = 31+28+31;
			break;
		case 5:
			cday = 31+28+31+30;
			break;
		case 6:
			cday = 31+28+31+30+31;
			break;
		case 7:
			cday = 31+28+31+30+31+30;
			break;
		case 8:
			cday = 31+28+31+30+31+30+31;
			break;
		case 9:
			cday = 31+28+31+30+31+30+31+31;
			break;
		case 10:
			cday = 31+28+31+30+31+30+31+31+30;
			break;
		case 11:
			cday = 31+28+31+30+31+30+31+31+30+31;
			break;
		case 12:
			cday = 31+28+31+30+31+30+31+31+30+31+30;
			break;
	}
	cday += day;
	if( (year % 4 ==0 && year % 100 !=0 || year % 400 == 0) && month > 2) {
		cday += 1;
	}
	printf("%d\n",cday);
}
