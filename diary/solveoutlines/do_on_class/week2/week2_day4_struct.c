#include <stdio.h>

#define LEN 20
#define NUM 2

struct date
{
	int year;
	int month;
	int day;
};

struct person
{
	char name[LEN];
	int age;
	double height;
	double weight;
	struct date birthday;
};

void data_print(const struct person *p,int n);
void data_inputer(struct person *p,int n);
void my_getline(char *s);

int main()
{
	struct person people[NUM];

	printf("%lu\n",sizeof(struct person));
	printf("%lu\n",sizeof(people));
	data_inputer(people,NUM);
	data_print(people,NUM);

	return 0;
}
void data_print(const struct person *p,int n)
{
	int i;
	for( i = 0; i < n; i++)
	{
	

		printf("name=%s\n",p[i].name);

		printf("age=%d\n",p[i].age);

		printf("height=%lf\tweight=%lf\n",p[i].height,p[i].weight);

		printf("year=%d,month=%d,day= %d\n",p[i].birthday.year,p[i].birthday.month,p[i].birthday.day);


	}
}


void data_inputer(struct person *p,int n)
{
	int i;
	
	for( i = 0; i < n; i++)
	{
		printf("input name:\t")	;
		my_getline((p[i].name));

		printf("input age:\t")	;
		scanf("%d",&(p[i].age));

		printf("input height,weight\t")	;
		scanf("%lf,%lf",&(p[i].height),&(p[i].weight));

		printf("input year,month,day\t")	;
		scanf("%d,%d,%d",&(p[i].birthday.year),&(p[i].birthday.month),&(p[i].birthday.day));

		while( getchar() != '\n')
			continue;
	}
}

void my_getline(char *s)
{
	int i =0;
	while((s[i]=getchar())!='\n')
		i++;
	s[i]='\0';
}
