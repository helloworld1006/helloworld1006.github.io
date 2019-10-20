#include<cstdio>
#include<string>
using namespace std;
int num[1000]={};
int main()
{
    int a;int b;
    scanf("%d%d",&a,&b);
    int sum=a+b;
    if (sum<0)
    {
    	printf("-");
    	sum=-sum;
    }
    int idx=0;
    do{
    	num[idx++]=sum%10;
    	sum/=10;
    }while(sum!=0);
    string ans;
    int cnt=1;
    for (int i = 0; i < idx; ++i)
    {
    	ans+=num[i]+'0';
    	if(cnt%3==0&&i!=idx-1){
    		ans+=",";
    	}
    	cnt++;
    }
    for (int i = ans.length() -1; i>= 0; i--)
    {
    	printf("%c", ans[i]);
    }
    printf("\n");
	return 0;
}