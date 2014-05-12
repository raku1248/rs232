/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/PROGRAMOWANIE/Github/rs232/rs232/emitter.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3623229338_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    int t19;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)0);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2088U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)1);
    if (t5 != 0)
        goto LAB11;

LAB12:
LAB6:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2088U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2328U);
    t3 = *((char **)t1);
    t15 = *((int *)t3);
    t2 = (t15 == 10);
    if (t2 != 0)
        goto LAB24;

LAB26:
LAB25:    goto LAB3;

LAB5:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 3712);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 2208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 2328U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2088U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB9;

LAB11:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t6 = *((unsigned char *)t4);
    t11 = (t6 == (unsigned char)3);
    if (t11 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB6;

LAB13:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 3776);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 9U, 1, 0LL);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t12 = (7 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t1 = (t3 + t14);
    t4 = (t0 + 3776);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_delta(t4, 1U, 8U, 0LL);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 3776);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 2088U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB14;

LAB16:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 2208U);
    t4 = *((char **)t1);
    t15 = *((int *)t4);
    t1 = (t0 + 1968U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t6 = (t15 == t16);
    if (t6 != 0)
        goto LAB19;

LAB21:    t1 = (t0 + 2208U);
    t3 = *((char **)t1);
    t15 = *((int *)t3);
    t1 = (t0 + 1968U);
    t4 = *((char **)t1);
    t16 = *((int *)t4);
    t2 = (t15 != t16);
    if (t2 != 0)
        goto LAB22;

LAB23:
LAB20:    goto LAB17;

LAB19:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 2208U);
    t8 = *((char **)t1);
    t1 = (t8 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 2328U);
    t4 = *((char **)t1);
    t15 = *((int *)t4);
    t16 = (t15 - 9);
    t12 = (t16 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, t15);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t3 + t14);
    t2 = *((unsigned char *)t1);
    t7 = (t0 + 3712);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t17 = *((char **)t10);
    *((unsigned char *)t17) = t2;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2328U);
    t3 = *((char **)t1);
    t15 = *((int *)t3);
    t16 = (t15 + 1);
    t1 = (t0 + 2328U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t16;
    goto LAB20;

LAB22:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2208U);
    t7 = *((char **)t1);
    t18 = *((int *)t7);
    t19 = (t18 + 1);
    t1 = (t0 + 2208U);
    t8 = *((char **)t1);
    t1 = (t8 + 0);
    *((int *)t1) = t19;
    goto LAB20;

LAB24:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2088U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB25;

}


extern void work_a_3623229338_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3623229338_3212880686_p_0};
	xsi_register_didat("work_a_3623229338_3212880686", "isim/ModuleTB_isim_beh.exe.sim/work/a_3623229338_3212880686.didat");
	xsi_register_executes(pe);
}
