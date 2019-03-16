fun sumpairs(L) =
if L = [] 
then []
else if tl(L) = [] 
then [hd(L)]
else 
hd(L) + hd(tl(L)) :: sumpairs(tl(tl(L)));

fun groupdupes(L) =
if L = [] 
then []
else if tl(L) = []
then [[hd(L)]]
else if hd(L) = hd(tl(L))
then [hd(L) :: hd(groupdupes(tl(L)))] @ tl(groupdupes(tl(L))) 
else [hd(L)] :: groupdupes(tl(L));

fun isPrimeHelp(Num, Divsr) =
if Num = Divsr
then true
else if Num mod Divsr = 0
then false
else isPrimeHelp(Num, Divsr+1);

fun isPrime(Num) =
isPrimeHelp(Num, 2);

fun goldbachHelp(N1, N2) =
if isPrime(N1-N2) andalso isPrime(N2)
then [N1-N2, N2]
else goldbachHelp(N1, N2+1);

fun goldbach(Num) = 
goldbachHelp(Num, 2);

fun convertBinary(Num) =
if Num = 0
then []
else  convertBinary(floor(real(Num)/real(2))) @ [Num mod 2];

fun length(L) =
if L = []
then 0
else length(tl(L))+1;

fun extendBinary(Bin, Len) =
if Len = 8
then Bin
else 0 :: extendBinary(Bin, Len+1);

fun bitwise_andHelp(L1, L2) =
if L1 = []
then []
else if hd(L1) = 1 andalso hd(L2) = 1
then 1 :: bitwise_andHelp(tl(L1), tl(L2))
else 0 :: bitwise_andHelp(tl(L1), tl(L2));

fun bitwise_and(Num1, Num2) = 
bitwise_andHelp(extendBinary(convertBinary(Num1), length(convertBinary(Num1))), extendBinary(convertBinary(Num2), length(convertBinary(Num2))));
