#include<cstdio>
double num[1010]={};
int main(){
	int k;
	scanf("%d",&k);
	int a; double b;
	for (int i = 0; i < k; ++i)
	{
		scanf("%d%lf",&a,&b);
		num[a]+=b;
	}
	scanf("%d",&k);
	for (int i = 0; i < k; ++i)
	{
		scanf("%d%lf",&a,&b);
		num[a]+=b;
	}
	int cnt=0;
	for (int i = 0; i < 1010; ++i)
	{
		if (num[i]!=0)
		{
			cnt++;
		}
	}
	printf("%d", cnt);
	for (int i = 1000; i >= 0; i--)
	{
		if (num[i]!=0)
		{
			printf(" %d %.1f",i,num[i]);
		}
	}
	printf("\n");
	return 0;
}