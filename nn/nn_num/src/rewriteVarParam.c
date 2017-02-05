#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void usage(void);

int main(int argc, char *argv[])
{
  if(argc != 4){
	usage();
  }else{
	if(!(0.0 <= atof(argv[1]) && atof(argv[1]) < 2.0))
	{
	  printf("ETAは0以上 2,0未満の実数を入力してください");
	}

	if(!(0.0 <= atof(argv[2]) && atof(argv[2]) < 2.0))
	{
	  printf("ALPHAは0以上 2,0未満の実数を入力してください");
	}

	if(!(1 <= atoi(argv[3]) && ceil(atoi(argv[3])) == floor(atoi(argv[3]))))
	{
	  printf("HIDDENは1以上の自然数を入力してください");
	}
  }


  FILE *writeParam;
  if((writeParam = fopen("varParam.h", "w")) == NULL )
  {
	fprintf(stderr, "file open writemode error\n");
	exit(EXIT_FAILURE);
  }

  char eta[30] ="#define ETA ";
  strcat(eta, argv[1]);

  char alpha[30] ="#define ALPHA ";
  strcat(alpha, argv[2]);

  char hidden[30] ="#define HIDDEN ";
  strcat(hidden, argv[3]);

  if(fprintf(writeParam, "%s\n%s\n%s\n", eta,alpha,hidden) < 0)
  {
	fprintf(stderr, "file write error\n");
	fclose(writeParam);
	return EXIT_FAILURE;
  }

  fclose(writeParam);
  return EXIT_SUCCESS;
}

void usage()
{
  printf("引数は ETA ALPHA HIDDENの順3つ");
}
