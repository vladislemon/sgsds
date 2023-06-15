#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int SGSDSF_MemIntensive(int n) {
    int *fValues = malloc((n + 1) * sizeof(int));
    fValues[1] = 1;
    int f = 1;
    for (int i = 2; i <= n; i++) {
        f = 1 + fValues[i - fValues[f]];
        fValues[i] = f;
        //printf("n=%d, f=%d, ff=%d\n", i, f, i - fValues[f]);
    }
    free(fValues);
    return f;
}
//   ########################
//   ****  ************|************************************************************  ******
//   ^ ^                                                                                ^
//   | |                                                                                |
//inline int f(int n) {
//    if(n < 2) return 1;
//    return 1 + f(n - f(f(n - 1)));
//}

int SGSDSF(int n) {
    int fNearLength = (int) (powf((float) n, 0.618F) * 1.205F) + 10;
    int fFarLength = (int) (powf((float) n, 0.4F) * 1.205F) + 20;
    int *fNearValues = malloc(fNearLength * sizeof(int));
    int *fFarValues = malloc(fFarLength * sizeof(int));
    int f = 1;
    fNearValues[1] = 1;
    fFarValues[1] = 1;
    for (int i = 2; i <= n; i++) {
        f = 1 + fFarValues[(i - fNearValues[f]) % fFarLength];
        fFarValues[i % fFarLength] = f;
        if(i < fNearLength) {
            fNearValues[i] = f;
        }
        //printf("n=%d, f=%d\n", i, f);
    }
    free(fNearValues);
    free(fFarValues);
    return f;
}

int SGSDSF_Optimized(int n) {
    const int fNearLength = (int) (powf((float) n, 0.618F) * 1.205F) + 10;
    const int fFarLength = (int) (powf((float) n, 0.4F) * 1.205F) + 20;
    int *fNearValues = malloc(fNearLength * sizeof(int));
    int *fFarValues = malloc(fFarLength * sizeof(int));
    int f = 1;
    fNearValues[1] = 1;
    fFarValues[1] = 1;
    for (int i = 2; i < fNearLength; i++) {
        f = 1 + fFarValues[(i - fNearValues[f]) % fFarLength];
        fFarValues[i % fFarLength] = f;
        fNearValues[i] = f;
    }
    for (int i = fNearLength; i <= n; i++) {
        f = 1 + fFarValues[(i - fNearValues[f]) % fFarLength];
        fFarValues[i % fFarLength] = f;
    }
    free(fNearValues);
    free(fFarValues);
    return f;
}

int main() {
    int n = 2000000000;
    printf("n=%d, f=%d\n", n, SGSDSF_Optimized(n));
    //printf("n=%d, f=%d\n", n, SGSDSF_MemIntensive(n));
    return 0;
}
