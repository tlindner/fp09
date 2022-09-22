/*********************
* Motorola MC6839
* Floating-Point ROM for the MC6809
* © 1982 Motorola
*
* C header created by tim lindner
* <tlindner@macmess.org>
*
* December 2020
*
* This header is in the public domain
*
**********************/

typedef struct fp09_FPCB {
    unsigned char control;
    unsigned char trap_enable;
    unsigned char status;
    unsigned char secondary_status;
    void (*trap_routine)();
} fp09_FPCB;

// FPCB Control Flags
#define fp09_projective_closure 0x00
#define fp09_affine_closure     0x01

#define fp09_rounding_mode_rn 0x00
#define fp09_rounding_mode_rz 0x02
#define fp09_rounding_mode_rp 0x04
#define fp09_rounding_mode_rm 0x06

#define fp09_internal_normalize 0x08

#define fp09_single_type 0x00
#define fp09_double_type 0x20
#define fp09_extended_nr 0x40
#define fp09_extended_rs 0x60
#define fp09_extended_rd 0x80

// FPCB Status and Trap Enable flags
#define fp09_status_invalid_operation 0x01
#define fp09_status_overflow          0x02
#define fp09_status_underflow         0x04
#define fp09_status_division_zero     0x08
#define fp09_status_unordered         0x10
#define fp09_status_integer_overflow  0x20
#define fp09_status_inexact_result    0x40
#define fp09_status_undefined         0x80

// Trap vector routine parameters
#define fp09_trap_vector_invalid_op       0
#define fp09_trap_vector_overflow         1
#define fp09_trap_vector_underflow        2
#define fp09_trap_vector_divide_zero      3
#define fp09_trap_vector_unnormalized     4
#define fp09_trap_vector_integer_overflow 5
#define fp09_trap_vector_inexact_result   6

// Secondary Status values
#define fp09_ss_no_error                   0
#define fp09_ss_square_root_error          1
#define fp09_ss_infinity_affine_mode_error 2
#define fp09_ss_nan_convert_error          3
#define fp09_ss_division_error             4
#define fp09_ss_trapping_nan_error         5
#define fp09_ss_unordered_values           6
#define fp09_ss_k_out_of_range             7
#define fp09_ss_illegal_use_of_inf         8
#define fp09_ss_0_x_infinity               9
#define fp09_ss_arg2_zero_arg1_inf         10
#define fp09_ss_mov_error                  15
#define fp09_invalid_result                16

typedef struct fp09_bcd {
    unsigned char exp_sign;
    unsigned char exp[4];
    unsigned char fraction_sign;
    unsigned char fraction[19];
    unsigned char fraction_digits;
} fp09_bcd;

typedef unsigned char *fp09_float;
typedef unsigned char fp09_single[4];
typedef unsigned char fp09_double[8];
typedef unsigned char fp09_extended[10];

void fp09_DECBIN( fp09_FPCB *cb, fp09_bcd *input, fp09_float result );
void fp09_BINDEC( fp09_FPCB *cb, unsigned short k, fp09_float arg2, fp09_bcd *result );
void fp09_FAB( fp09_FPCB *cb, fp09_float arg2, fp09_float result );
void fp09_FADD( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, fp09_float result );
void fp09_FDIV( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, fp09_float result );
void fp09_FFIXS( fp09_FPCB *cb, fp09_float arg2, short *result );
void fp09_FFIXD( fp09_FPCB *cb, fp09_float arg2, long *result );
void fp09_FFLTS( fp09_FPCB *cb, short *arg2, fp09_float result );
void fp09_FFLTD( fp09_FPCB *cb, long *arg2, fp09_float result );
void fp09_FINT( fp09_FPCB *cb, fp09_float arg2, fp09_float result );
void fp09_FMUL( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, fp09_float result );
void fp09_FNEG( fp09_FPCB *cb, fp09_float arg2, fp09_float result );
void fp09_FREM( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, fp09_float result );
void fp09_FSUB( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, fp09_float result );
void fp09_FSQRT( fp09_FPCB *cb, fp09_float arg2, fp09_float result );

// Compare Parameter word
#define fp09_cmp_not_equal     (1<<12)
#define fp09_cmp_greater_than  (1<<11)
#define fp09_cmp_equal         (1<<10)
#define fp09_cmp_less_than     (1<<9)
#define fp09_cmp_unordered     (1<<8)
#define fp09_cmp_arg1_single   (0)
#define fp09_cmp_arg1_double   (1<<4)
#define fp09_cmp_arg1_extended (1<<5)
#define fp09_cmp_arg2_single   (0)
#define fp09_cmp_arg2_double   (1<<0)
#define fp09_cmp_arg2_extended (1<<1)

int fp09_FCMP( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, unsigned short parameter );
int fp09_FTCMP( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, unsigned short parameter );
int fp09_FPCMP( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, unsigned short parameter );
int fp09_FTPCMP( fp09_FPCB *cb, fp09_float arg2, fp09_float arg1, unsigned short parameter );

#define fp09_mov_arg2_single     (0)
#define fp09_mov_arg2_double     (1<<4)
#define fp09_mov_arg2_extended   (1<<5)
#define fp09_mov_result_single   (0)
#define fp09_mov_result_double   (1<<0)
#define fp09_mov_result_extended (1<<1)

void fp09_FMOV( fp09_FPCB *cb, unsigned short parameter, fp09_float arg2, fp09_float result );
