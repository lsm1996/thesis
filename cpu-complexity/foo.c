#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>

int workforce[3000]={0};

int main()
{
    char line[1024];
    FILE *f=fopen("intel_workforce.csv","r");
    line[0]=0; fgets(line,1024,f);
    while(line[0]) {
      int year,count;
      if (sscanf(line,"%d;%d",&year,&count)==2) {
         workforce[year]=count;
      }
      line[0]=0; fgets(line,1024,f);
    }
    fclose(f);


    line[0]=0; fgets(line,1024,stdin);
    while(line[0]) {
      char proc[1024],trans[1024],year[1024],vendor[1024];
      if (sscanf(line,"%[^\t]\t%[^\t]\t%[^\t]\t%[^\t]",proc,trans,year,vendor)==4) {
         int o=0; char t[1024]; for(int i=0;trans[i];i++) if (trans[i]!=',') t[o++]=trans[i];
         t[o]=0;
         long long trancount=strtoll(t,NULL,10);
         if ((!strncmp(vendor,"Intel",5)))
         printf("%s;%s;%lld;%lf\n",year,proc,trancount,trancount*1.0/workforce[atoi(year)]);
         // 9 designers for 6502 via http://www.commodore.ca/gallery/magazines/misc/mos_605x_team_eetimes_august_1975.pdf
//         if ((!strncmp(vendor,"MOS",3)))
//         printf("%s;%s;%lld;%lf\n",year,proc,trancount,trancount/9.0);
      }
 
      line[0]=0; fgets(line,1024,stdin);
    }
}
