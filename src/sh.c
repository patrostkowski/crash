#include <bits/types/idtype_t.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

#define MAX_COMMAND_SIZE 255

int main(void)
{
	char buffer[MAX_COMMAND_SIZE];

	/*
	char command[MAX_COMMAND_SIZE] = "/bin/";
	TODO add path handling
	*/
	char command[MAX_COMMAND_SIZE] = "";

	for (;;)
	{
		write(1, "$ ", 2);
		int count = read(0, buffer, MAX_COMMAND_SIZE);
		buffer[count - 1] = 0;
		strcat(command, buffer);

		pid_t fork_result = fork();
		if (fork_result == 0)
		{
			execve(command, 0, 0);
			break;
		}
		else
		{
			siginfo_t info;
			waitid(P_ALL, 0, &info, 4);
		}
	}
	return 0;
}
