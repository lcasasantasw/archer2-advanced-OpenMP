#include <stdio.h>
#include <math.h>
#include <omp.h>


#define N 1024
#define M 100
#define REPS 100000

void sumsubfs(int); 

double x[M][N];


int main(int argv, char **argc){

  int i,j,c;
  double time1, time2; 


  for (i=0;i<M;i++) {
    for (j=0;j<N;j++) {
      x[i][j] = 3.142; 
    }
  }


  printf("Offset    Nanosec/ref\n");

  for (c=0;c<64;c++){
    time1=omp_get_wtime();
    for (i=0;i<REPS;i++){
      sumsubfs(c); 
    }
    if (x[0][0] < 0.0) printf("Help!\n"); 
    time2=omp_get_wtime();

    printf("%d        %f\n",c-20,(1000000000.*(time2-time1))/(float)(M*REPS) );
  }
	   
}


void sumsubfs(int c){

      int i,id;

#pragma omp parallel private(i,id)
      {
        id = omp_get_thread_num(); 
	if (id==0) {
	  
	  for (i=0;i<M;i++){
	    x[i][20]+=3.142;
	  }
	}
	else {
	  if (id==1) {
	    
	    for (i=0;i<M;i++){
	      x[i][c]+=3.142;
	    }

	  }
	}
      }
  

}

