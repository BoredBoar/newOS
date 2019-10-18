struct example {
    unsigned char consifg; //bit 0 - 7
    unsigned char address; //bit 8 - 23
    unsigned char index; //bit 24-31
} __attribute__((packed));

int test_func(void) {
    return 0x1234567;
};