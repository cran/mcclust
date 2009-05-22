#include <R.h>
void comp_psm(int *psm, int *zdraw, int *n, int *M){
     int i,j,m;    
             for(m=0;m<*M;m++){     
                  for(i=0; i<*n; i++){
                      for(j=0;j<*n;j++){
                                   if(zdraw[i+ m* *n] == zdraw[j+ m* *n]) psm[i * *n +j]++;                 
                      }            
                  }
             }
}
