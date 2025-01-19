#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    char str[] = "Hello,World,This,Is,C";
    const char delimiter[] = ",";
    char* token;

    // Get the first token 
    token = strtok(str, delimiter);

    // Walk through other tokens 
    while (token != NULL) {
        printf("%s\n", token);
        token = strtok(NULL, delimiter);
    }

    return 0;
}