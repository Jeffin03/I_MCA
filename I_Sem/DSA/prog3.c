#include<stdio.h>
#include<stdlib.h>
int prec(char c);
char stack[100];
int top=-1;
void push(char num);
char pop();
void infixtopostfix(char str[]);
int main()
{
	char str[100];
	int ch;
	printf("\nEnter an expression:");
	scanf("%s",str);
	infixtopostfix(str);
	return 0;
}
int prec(char c)
{
	if(c=='^')
	{
		return 3;
	}
	else if(c=='/'||c=='*')
	{
		return 2;
	}
	else if(c=='+'||c=='-')
	{
		return 1;
	}
	else
	{
		return -1;
	}
}
void push(char num)
{
	stack[++top]=num;
}
char pop()
{
	char c=stack[top];
	stack[top--]='\0';
	return(c);
}
void infixtopostfix(char str[])
{
	int i=0;
	while(str[i]!='\0')
	{
		if(str[i]>=65&&str[i]<=90||str[i]>=97&&str[i]<=122)
		{
			printf("%c", str[i]);
		}
		else if(str[i]=='(')
		{
			push(str[i]);
		}
		else if(str[i]==')')
		{
			char c;
			do
			{
				c=pop();
				if(c!='(')
				{
					printf("%c",c);
				}
			}while(c!='(');
		}
		else
		{
			while(top!=-1&&prec(str[i])<=prec(stack[top]))
			{
				printf("%c",pop());
			}
			push(str[i]);
		}
		i++;
	}
	while(top!=-1)
	{
		printf("%c",pop());
	}
	printf("\n");
	// getch(); // uncomment if you're executing on Turbo C
}
