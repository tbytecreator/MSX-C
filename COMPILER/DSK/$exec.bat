CPP -DCPM -DHI_TECH_C -Dz80 -I TESTE.C $C1.T
P1 $C1.T $C2.T $C3.T
CGEN $C2.T $C1.T
ZAS -N -oTESTE.O $C1.T
DEL $C1.T
DEL $C2.T
DEL $C3.T
LINK -Z -Ptext=0,data,bss -C100H -OTESTE.COM CRT.O TESTE.O LIBC.LIB
DEL TESTE.O
