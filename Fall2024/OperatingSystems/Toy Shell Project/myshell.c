/***********************************************************************************//**
  @file         myshell.c
  @author       Cameron Hartling
  @id           007735059
  @date         29 September 2024
  @purpose      Project Toy Shell Implementation. A shell with basic capapbilities.
***************************************************************************************/

#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *shellname = "myshell";
char *terminator = ">";
int numberOfNewnames = 0;
char *oldNames[10] = {};
char *newNames[10] = {};

/*
  Function Declarations for built in shell commands:
 */
int stop(char **args);
int setshellname(char **args);
int setterminator(char **args);
int newname(char **args);
int listnewnames(char **args);
int savenewnames(char **args);
int readnewnames(char **args);
// int unixcmd(char **args);
int help(char **args);

/*
  List of built in commands, followed by their corresponding functions.
 */
char *builtin_str[] = {
    "stop",
    "setshellname",
    "setterminator",
    "newname",
    "listnewnames",
    "savenewnames",
    "readnewnames",
    // "unixcmd",
    "help"
};

int (*builtin_func[]) (char **) = {
    &stop,
    &setshellname,
    &setterminator,
    &newname,
    &listnewnames,
    &savenewnames,
    &readnewnames,
    // &unixcmd,
    &help
};

int lsh_num_builtins() {
  return sizeof(builtin_str) / sizeof(char *);
}

/*
  Built in function implementations.
*/

/**
   @brief Built in command: stop.
   @param args List of args.  Not examined.
   @return Always returns 0, to terminate execution.
 */
int stop(char **args)
{
  return 0;
}

/**
    @brief Built in command: setshellname.
    @param args List of args.  args[1] used for new shell name.
    @return Always returns 1, to continue execution.
 */
int setshellname(char **args)
{
	if (args[1] == NULL)
		shellname = "myshell";
	else
		shellname = args[1];

	return 1;
}

/**
    @brief Built in command: setterminator.
    @param args List of args.  args[1] used for new terminator
    @return Always returns 1, to continue execution.
 */
int setterminator(char** args)
{
    if (args[1] == NULL)
        shellname = "myshell";
    else
        shellname = args[1];

    return 1;
}

/**
    @brief Built in command: newname.
    @param args List of args. args[1] deletes said alias. args[2] adds args[1] and args[2] to alias list.
    @return Always returns 1, to continue execution.
 */
int newname(char** args)
{
    int i;
    int j;
    bool there = false;
    
    if (args[1] == NULL)//error handling
    {
        fprintf(stderr, "lsh: expected argument to \"newname\"\n");
    }
    if (args[2] == NULL)
    {
        for (i = 0; i < numberOfNewnames; i++)
        {
            if (newNames[i] == args[1])
            {
                for (j = i; j < numberOfNewnames - 1; j++)
                {
                    newNames[j] = args[j+1];
                    oldNames[j] = args[j+1];
                }

                numberOfNewnames -= 1;
                there = true;
                break;
            }
        }
        if (!there)//error handling
        {
            fprintf(stderr, "lsh: no %s in alias list\n", args[1]);
        }
    }
    else
    {
        if (numberOfNewnames == 0)//error handling
        {
            fprintf(stderr, "lsh: alias list full\n");
        }
        else
        {
            newNames[numberOfNewnames] = args[1];
            oldNames[numberOfNewnames] = args[2];
            numberOfNewnames++;
        }
    }
    return 1;
}

/**
    @brief Built in command: listnewnames.
    @param args List of args. args[1] used to open file.
    @return Always returns 1, to continue execution.
 */
int listnewnames(char** args)
{
    int i;
    
    if (numberOfNewnames == 0)//error handling
    {
        fprintf(stderr, "lsh: There are no aliases currently set.\n");
    }
    else
    {
        for (i = 0; i < numberOfNewnames; i++)
        {
                printf("%s %s\n", newNames[i], oldNames[i]);
        }
    }

    return 1;
}

/**
    @brief Built in command: savenewnames.
    @param args List of args. args[1] used to open file.
    @return Always returns 1, to continue execution.
 */
int savenewnames(char** args)
{
    int i;
    FILE* fptr;

    fptr = fopen(args[1], "w");

    if (fptr == NULL)//error handling
    {
        fprintf(stderr, "lsh: Error opening file.\n");
        return 1;
    }

    for (i = 0; i < numberOfNewnames; i++)
    {
            fprintf("%s %s", newNames[i], oldNames[i]);
    }

    fclose(fptr);

    return 1;
}

/**
    @brief Built in command: readnewnames.
    @param args List of args. args[1] used to open file.
    @return Always returns 1, to continue execution.
 */
int readnewnames(char** args)
{
    FILE* fptr;
    char line[512];

    if ((fptr = fopen(args[1], "r")) == NULL)// Error handling
    {
        fprintf(stderr, "lsh: Error opening file.\n");
        return 1;
    }

    while (fgets(line, 512, fptr) != NULL)
    {
        sscanf(line, "%s %s", str1, str2);
        printf("%s %s",str1,str2);
    }

    fclose(fptr);

    return 1;
}

/**
   @brief Built in command: print help.
   @param args List of args.  Not examined.
   @return Always returns 1, to continue executing.
 */
int help(char **args)
{
  int i;
  printf("Cameron Hartling's LSH\n");
  printf("Type program names and arguments, and hit enter.\n");
  printf("The following are built in:\n");

  for (i = 0; i < lsh_num_builtins(); i++) {
    printf("  %s\n", builtin_str[i]);
  }

  printf("Use the man command for information on other programs.\n");
  return 1;
}







/**
  @brief Launch a program and wait for it to terminate.
  @param args Null terminated list of arguments (including program).
  @return Always returns 1, to continue execution.
 */
int lsh_launch(char **args)
{
  pid_t pid;
  int status;

  pid = fork();
  if (pid == 0) {
    // Child process
    if (execvp(args[0], args) == -1) {
      perror("lsh");
    }
    exit(EXIT_FAILURE);
  } else if (pid < 0) {
    // Error forking
    perror("lsh");
  } else {
    // Parent process
    do {
      waitpid(pid, &status, WUNTRACED);
    } while (!WIFEXITED(status) && !WIFSIGNALED(status));
  }

  return 1;
}

/**
   @brief Execute shell built in or launch program.
   @param args Null terminated list of arguments.
   @return 1 if the shell should continue running, 0 if it should terminate
 */
int lsh_execute(char **args)
{
  int i;
  bool found = false;

  if (args[0] == NULL) {
    // An empty command was entered.
    return 1;
  }

  for (i = 0; i < numberOfNewNames; i++)
  {
      if (strcmp(args[0], newNames[i]) == 0)
          args[0] = oldNames[i];
  }

  for (i = 0; i < lsh_num_builtins(); i++) {
    if (strcmp(args[0], builtin_str[i]) == 0) {
      return (*builtin_func[i])(args);
    }
  }

  return lsh_launch(args);
}

/**
   @brief Read a line of input from stdin.
   @return The line from stdin.
 */
char *lsh_read_line(void)
{
    char* line = NULL;
    ssize_t bufsize = 0; // have getline allocate a buffer for us

    if (getline(&line, &bufsize, stdin) == -1) {
        if (feof(stdin)) {
            exit(EXIT_SUCCESS);  // We recieved an EOF
        }
        else {
            perror("readline");
            exit(EXIT_FAILURE);
        }
    }

    return line;
}

#define LSH_TOK_BUFSIZE 64
#define LSH_TOK_DELIM " \t\r\n\a"
/**
   @brief Split a line into tokens (very naively).
   @param line The line.
   @return Null-terminated array of tokens.
 */
char **lsh_split_line(char *line)
{
  int bufsize = LSH_TOK_BUFSIZE, position = 0;
  char **tokens = malloc(bufsize * sizeof(char*));
  char *token, **tokens_backup;

  if (!tokens) {
    fprintf(stderr, "lsh: allocation error\n");
    exit(EXIT_FAILURE);
  }

  token = strtok(line, LSH_TOK_DELIM);
  while (token != NULL) {
    tokens[position] = token;
    position++;

    if (position >= bufsize) {
      bufsize += LSH_TOK_BUFSIZE;
      tokens_backup = tokens;
      tokens = realloc(tokens, bufsize * sizeof(char*));
      if (!tokens) {
		free(tokens_backup);
        fprintf(stderr, "lsh: allocation error\n");
        exit(EXIT_FAILURE);
      }
    }

    token = strtok(NULL, LSH_TOK_DELIM);
  }
  tokens[position] = NULL;
  return tokens;
}

/**
   @brief Loop getting input and executing it.
 */
void lsh_loop(void)
{
  char *line;
  char **args;
  int status;

  do {
    printf("%s ", shellname,"%s ",terminator);
    line = lsh_read_line();
    args = lsh_split_line(line);
    status = lsh_execute(args);

   free(line);
   free(args);
  } while (status);
}

/**
   @brief Main entry point.
   @param argc Argument count.
   @param argv Argument vector.
   @return status code
 */
int main(int argc, char **argv)
{
  // Load config files, if any.

  // Run command loop.
  lsh_loop();

  // Perform any shutdown/cleanup.

  return EXIT_SUCCESS;
}
