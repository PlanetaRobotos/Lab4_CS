#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>


 int main (int argc, char * argv[]) {
    
         int i;
          int line=1;
    char buf[256];
         
         
         for( i = 0 ; i < argc; i++) {
                 printf("Argument %d: %s\n", i, argv[i]);
         }
         if(argc == 1) {
                 printf("Command line has no additional arguments\n");
         }

    FILE *myFile = fopen(argv[1], "r");
    char str[128];
    
    
    if (myFile == NULL) {
        printf("Open error \n");
       }

while(!feof (myFile)) {
if (fgets(str, 126, myFile))
printf("%s", str);
}
//fclose(fp);

    int fd;
    void *start;
    struct stat sb;
    fd = open (argv[0], O_RDONLY); /* Открыть / etc / passwd */
         fstat (fd, & sb); /* Получить размер файла */
    start = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
         if (start == MAP_FAILED) /*определить, является ли сопоставление успешным */
    //    return;
    //    printf ("% s", начало); munmap (начало, sb.st_size); /* Unmap */
    //fclose(fd);




         return 0;
 }
