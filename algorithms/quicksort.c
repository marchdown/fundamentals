#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <assert.h>
void quickSort(int ar_size, int *ar) {
  if (ar_size <= 1)
       return;
  // ^ check if we need to do anything at all, if so, proceed to declare and allocate variables.
   int p   = ar[0];
   //   int *ls = malloc(ar_size*sizeof(int));
   //   int *hs = malloc(ar_size*sizeof(int));
   int ls[ar_size];
   int hs[ar_size];
   int lp = 0;
   int hp = 0;
   int i;
   for (i = 1; i < ar_size; i++) { // count from 1 because ar[0] is the pivot. walk ar_size-1 elements.
        if (ar[i] < p) {
            ls[lp]=ar[i]; lp++;
        }
        
        else {
            hs[hp]=ar[i]; hp++;
        }
   }
   
   quickSort(lp, ls);
   quickSort(hp, hs);
   // reuse i;
   for (i = 0; i < lp-1; i++) {
        ar[i] = ls[i];
    }
    ar[lp-1] = p;
    for (i = lp; i < ar_size; i++){
        ar[i] = hs[i];
    }
    for (i = 0; i < ar_size; i++) {
        printf("%d ", ar[i]);
    }
    printf("\n");
    return;
//    print(*ar); // TODO: implement print_seq

   /// we're lucky not to have to calculate or pass around length of the array.
   //sorted_array = concat_and_store(where_to_store_concatenated_subarrays, hs, p, ls); // procedure
}
int main(void) {
   int ar_size;
   scanf("%d", &ar_size);
   int ar[ar_size], i;
   for(i = 0; i < ar_size; i++) { 
      scanf("%d", &ar[i]); 
   }

   quickSort(ar_size, ar);
   
   return 0;
}
