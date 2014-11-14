#include <stdio.h>
#include <stdlib.h>


#define LEN 20

struct stu
{
	char name[LEN];
	int age;
	int score;
};

void input_oneline(char *p);

int main(void)
{
	//指向结构体的指针；
	struct stu *student;
	struct stu *s=NULL;
#if 0
	struct stu s1;
	printf("%lu\n",sizeof(student));
	printf("%lu\n",sizeof(struct stu));
	printf("%lu\n",sizeof(s1));
#endif
	student = malloc(sizeof(struct stu));

	if(student != NULL)
	{
		printf("input name:\t");
		input_oneline(student->name); //	input_oneline(*(student).name);

		printf("\ninput age:\t");
		scanf("%d",&student->age);

		printf("\ninput score:\t");
		scanf("%d",&student->score);

		printf("\nname=%s;age=%d;score=%d\n",student->name,student->age,student->score);


	}
	s = student;  //结构体数组可以整体赋值；
	printf("\nname=%s;age=%d;score=%d\n",s->name,s->age,s->score);
	free(student);
	student=NULL;
	return 0; 

}
void input_oneline(char *p)
{
	int i = 0;
	while( (p[i]=getchar())!= '\n')
		i++;
	p[i] = '\0';
}
