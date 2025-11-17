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
    // Set the pointer to our linked list to NULL (the list starts empty)
    node_t *head = 0;
    
    // Ask the user to make a selection as long as they don't type 'q'
    char selection;
    do
    {
        // Do not write a custom printf() function, use PUTS TRAP on LC3 for printing these strings
        printf("Available options:\n");
        printf("p - Print linked list\n");
        printf("a - Add value to linked list\n");
        printf("r - Remove value from linked list\n");
        printf("q - Quit\n");
        printf("Choose an option: ");
        // To read the integer, use your custom TRAP service routine
        scanf(" %c", &selection);
        
        // if the user selected 'p'
        if(selection == 'p')
        {
            // Print the entire list to the screen
            printList(&head);
        }
        // if the user selected 'a'
        else if(selection == 'a')
        {
            // Ask the user what number to append to the list
            int a = 0;
            printf("Type a number to add: ");
            scanf("%d", &a);

            // Append the number to the list
            addValue(&head, a);
        }
        // if the user selected 'r'
        else if(selection == 'r')
        {
            // Ask the user what number to remove from the list
            int r = 0;
            printf("Type a number to remove: ");
            scanf("%d", &r);

            // Remove the number from the list
            removeValue(&head, r);
        }

    }while(selection != 'q'); // Check if the user typed 'q' to see if the loop should continue
}

void printList(node_t **head)
{
    // Point the the head of our list
    node_t *current = *head;

    // While we are not pointing at NULL (end of list)
    while(current != 0)
    {
        // Print the value of the link in the list
        // To print the integer, use your custom TRAP service routine
        printf("%d", current->value);

        // Continue to the next node in the list
        current = current->next;
        
        // If the current pointer is not null (0), then print an arrow for the next value
        if(current != 0)
        {
            printf(" -> ");
        }
    }
    
    // Print a new line to keep everything looking clean
    printf("\n");
    
    return;
}

void addValue(node_t **head, int added)
{
    // Point the the head of our list
    node_t *current = *head;
    
    // If we are pointing at NULL (the list is completely empty)
    if(current == 0)
    {
        node_t *newNode = (node_t *) malloc(sizeof(node_t));    // Create a new node (Do not write your own malloc() or free() functions, just use some predetermined area of memory + some offset to place the new links)
        newNode->value = added;                                 // Set the value to the value we wanted to add to the list
        newNode->next = 0;                                      // Point this node to NULL (this new node is the end of list)
        *head = newNode;                                        // Set the start of our list to point to the new node
        return;
    }
    
    // While we are not pointing at NULL (end of list)
    while(current != 0)
    {
        // If the next node is NULL (it's the last node in the list)
        if(current->next == 0)
        {
            node_t *newNode = (node_t *) malloc(sizeof(node_t));// Create a new node (Do not write your own malloc() or free() functions, just use some predetermined area of memory + some offset to place the new links)
            newNode->value = added;                             // Set the value to the value we wanted to add to the list
            newNode->next = 0;                                  // Point this node to NULL (this new node is the end of list)
            current->next = newNode;                            // Set the end of our list to point to the new node
            return;
        }
        
        // If we have not reached the end of the list, travel to the next node
        current = current->next;
    }
    
    return;
}

void removeValue(node_t **head, int removed)
{
    // Point the the head of our list
    node_t *prev = *head;

    // If the start of the list is NULL (empty list)
    if(prev == 0)
    {
        // Return without doing anything
        return;
    }
    
    // If the value at the start of the list is the value we want to remove
    if((*head)->value == removed)
    {
        (*head) = (*head)->next;    // Point the start of our list to the next node in the list (could be NULL)
        free(prev);                 // Free up the memory associated with the removed node (Do not write your own malloc() or free() functions, just use some predetermined area of memory + some offset to place the new links)
        return;
    }
    
    // Point to the next node in the list if we did not remove anything yet
    node_t *current = (*head)->next;
    
    // While we are not pointing at NULL (end of list)
    while(current != 0)
    {
        // If the current node we are looking at is the node we want to remove
        if(current->value == removed)
        {
            prev->next = current->next; // Get the previous node and set it's next pointer to this pointer's next node (destroying the link to the current node)
            free(current);              // Free up the memory associated with the removed node (Do not write your own malloc() or free() functions, just use some predetermined area of memory + some offset to place the new links)
            return;
        }
        
        // If we are not pointing at NULL (end of list)
        if (current != 0)
        {
            prev = current;             // Set the previous pointer as the node we last looked at (current)
            current = current->next;    // Set the current node to the next node in the list
        }
    }
    
    return;
}
