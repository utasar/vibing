#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int value;
    struct node *next;
} node_t;

void printList(node_t **head);
void addValue(node_t **head, int added);
void removeValue(node_t **head, int removed);

int main()
{
    node_t *head = NULL; // Initialize head to NULL
    
    char selection = 's';
    
    while (selection != 'q')
    {
        printf("\nAvailable options:\n");
        printf("p - Print linked list\n");
        printf("a - Add value to linked list\n");
        printf("r - Remove value from linked list\n");
        printf("q - Quit\n");
        printf("Choose an option: ");
        scanf(" %c", &selection);
        
        if (selection == 'p')
        {
            printList(&head);
        }
        else if (selection == 'a')
        {
            int a = 0;
            printf("Type a number to add: ");
            if (scanf("%d", &a) != 1)
            {
                printf("Invalid input\n");
                while (getchar() != '\n'); // Clear invalid input
                continue;
            }
            addValue(&head, a);
        }
        else if (selection == 'r')
        {
            int r = 0;
            printf("Type a number to remove: ");
            if (scanf("%d", &r) != 1)
            {
                printf("Invalid input\n");
                while (getchar() != '\n'); // Clear invalid input
                continue;
            }
            removeValue(&head, r);
        }
    }
    
    // Free the linked list before exiting
    node_t *current = head;
    while (current != NULL)
    {
        node_t *temp = current;
        current = current->next;
        free(temp);
    }
    
    return 0;
}

void printList(node_t **head)
{
    if (*head == NULL)
    {
        printf("The list is empty.\n");
        return;
    }

    node_t *current = *head;
    while (current != NULL)
    {
        printf("%d", current->value);
        current = current->next;
        
        if (current != NULL)
        {
            printf(" -> ");
        }
    }
    printf("\n");
}

void addValue(node_t **head, int added)
{
    if (*head == NULL)
    {
        // Create the first node
        *head = (node_t *)malloc(sizeof(node_t));
        if (*head == NULL)
        {
            fprintf(stderr, "Memory allocation failed\n");
            return;
        }
        (*head)->value = added;
        (*head)->next = NULL; // Initialize next pointer
        return;
    }

    node_t *current = *head;
    while (current->next != NULL)
    {
        current = current->next;
    }

    // Add new node at the end
    current->next = (node_t *)malloc(sizeof(node_t));
    if (current->next == NULL)
    {
        fprintf(stderr, "Memory allocation failed\n");
        return;
    }
    current->next->value = added;
    current->next->next = NULL; // Initialize next pointer
}

void removeValue(node_t **head, int removed)
{
    if (*head == NULL)
        return;

    node_t *current = *head;
    node_t *prev = NULL;

    // Check if the head needs to be removed
    if (current->value == removed)
    {
        *head = current->next;
        free(current);
        return;
    }

    // Traverse the list to find the node to remove
    while (current != NULL)
    {
        if (current->value == removed)
        {
            prev->next = current->next;
            free(current);
            return;
        }
        prev = current;
        current = current->next;
    }
}
