¨5
¨/ù.
W
AddN
inputs"T*N
sum"T"
Nint(0"!
Ttype:
2	
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
E
AssignAddVariableOp
resource
value"dtype"
dtypetype
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

À
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

À
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

;
Elu
features"T
activations"T"
Ttype:
2
L
EluGrad
	gradients"T
outputs"T
	backprops"T"
Ttype:
2
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
A
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
ù
FusedBatchNormGradV3

y_backprop"T
x"T	
scale
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U

x_backprop"T
scale_backprop"U
offset_backprop"U
reserve_space_4"U
reserve_space_5"U"
Ttype:
2"
Utype:
2"
epsilonfloat%·Ñ8";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
ú
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%·Ñ8"&
exponential_avg_factorfloat%  ?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
9
	IdentityN

input2T
output2T"
T
list(type)(0
,
Log
x"T
y"T"
Ttype:

2
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
?
Mul
x"T
y"T
z"T"
Ttype:
2	
0
Neg
x"T
y"T"
Ttype:
2
	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
8
Pow
x"T
y"T
z"T"
Ttype:
2
	

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
7

Reciprocal
x"T
y"T"
Ttype:
2
	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
à
ResourceApplyAdam
var
m
v
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
-
Sqrt
x"T
y"T"
Ttype:

2
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
-
Tanh
x"T
y"T"
Ttype:

2
:
TanhGrad
y"T
dy"T
z"T"
Ttype:

2
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 
&
	ZerosLike
x"T
y"T"	
Ttype"serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68³ô0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
l
save_counterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_namesave_counter
e
 save_counter/Read/ReadVariableOpReadVariableOpsave_counter*
_output_shapes
: *
dtype0	

conv2d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameconv2d_4/kernel
{
#conv2d_4/kernel/Read/ReadVariableOpReadVariableOpconv2d_4/kernel*&
_output_shapes
:*
dtype0

batch_normalization_6/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_6/gamma

/batch_normalization_6/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_6/gamma*
_output_shapes
:*
dtype0

batch_normalization_6/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_namebatch_normalization_6/beta

.batch_normalization_6/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_6/beta*
_output_shapes
:*
dtype0

!batch_normalization_6/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!batch_normalization_6/moving_mean

5batch_normalization_6/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_6/moving_mean*
_output_shapes
:*
dtype0
¢
%batch_normalization_6/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%batch_normalization_6/moving_variance

9batch_normalization_6/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_6/moving_variance*
_output_shapes
:*
dtype0

conv2d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameconv2d_5/kernel
{
#conv2d_5/kernel/Read/ReadVariableOpReadVariableOpconv2d_5/kernel*&
_output_shapes
:*
dtype0

batch_normalization_7/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_7/gamma

/batch_normalization_7/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_7/gamma*
_output_shapes
:*
dtype0

batch_normalization_7/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_namebatch_normalization_7/beta

.batch_normalization_7/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_7/beta*
_output_shapes
:*
dtype0

!batch_normalization_7/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!batch_normalization_7/moving_mean

5batch_normalization_7/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_7/moving_mean*
_output_shapes
:*
dtype0
¢
%batch_normalization_7/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%batch_normalization_7/moving_variance

9batch_normalization_7/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_7/moving_variance*
_output_shapes
:*
dtype0

conv2d_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameconv2d_6/kernel
{
#conv2d_6/kernel/Read/ReadVariableOpReadVariableOpconv2d_6/kernel*&
_output_shapes
:*
dtype0

batch_normalization_8/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_8/gamma

/batch_normalization_8/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_8/gamma*
_output_shapes
:*
dtype0

batch_normalization_8/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_namebatch_normalization_8/beta

.batch_normalization_8/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_8/beta*
_output_shapes
:*
dtype0

!batch_normalization_8/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!batch_normalization_8/moving_mean

5batch_normalization_8/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_8/moving_mean*
_output_shapes
:*
dtype0
¢
%batch_normalization_8/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%batch_normalization_8/moving_variance

9batch_normalization_8/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_8/moving_variance*
_output_shapes
:*
dtype0

conv2d_7/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameconv2d_7/kernel
{
#conv2d_7/kernel/Read/ReadVariableOpReadVariableOpconv2d_7/kernel*&
_output_shapes
:*
dtype0

batch_normalization_9/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_9/gamma

/batch_normalization_9/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_9/gamma*
_output_shapes
:*
dtype0

batch_normalization_9/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_namebatch_normalization_9/beta

.batch_normalization_9/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_9/beta*
_output_shapes
:*
dtype0

!batch_normalization_9/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!batch_normalization_9/moving_mean

5batch_normalization_9/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_9/moving_mean*
_output_shapes
:*
dtype0
¢
%batch_normalization_9/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%batch_normalization_9/moving_variance

9batch_normalization_9/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_9/moving_variance*
_output_shapes
:*
dtype0
z
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
À*
shared_namedense_2/kernel
s
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel* 
_output_shapes
:
À*
dtype0

batch_normalization_10/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namebatch_normalization_10/gamma

0batch_normalization_10/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_10/gamma*
_output_shapes	
:*
dtype0

batch_normalization_10/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_10/beta

/batch_normalization_10/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_10/beta*
_output_shapes	
:*
dtype0

"batch_normalization_10/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"batch_normalization_10/moving_mean

6batch_normalization_10/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_10/moving_mean*
_output_shapes	
:*
dtype0
¥
&batch_normalization_10/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&batch_normalization_10/moving_variance

:batch_normalization_10/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_10/moving_variance*
_output_shapes	
:*
dtype0
z
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_3/kernel
s
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel* 
_output_shapes
:
*
dtype0

batch_normalization_11/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namebatch_normalization_11/gamma

0batch_normalization_11/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_11/gamma*
_output_shapes	
:*
dtype0

batch_normalization_11/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_namebatch_normalization_11/beta

/batch_normalization_11/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_11/beta*
_output_shapes	
:*
dtype0

"batch_normalization_11/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"batch_normalization_11/moving_mean

6batch_normalization_11/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_11/moving_mean*
_output_shapes	
:*
dtype0
¥
&batch_normalization_11/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&batch_normalization_11/moving_variance

:batch_normalization_11/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_11/moving_variance*
_output_shapes	
:*
dtype0
p
	pi/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
 *
shared_name	pi/kernel
i
pi/kernel/Read/ReadVariableOpReadVariableOp	pi/kernel* 
_output_shapes
:
 *
dtype0
g
pi/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	pi/bias
`
pi/bias/Read/ReadVariableOpReadVariableOppi/bias*
_output_shapes	
: *
dtype0
m
v/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*
shared_name
v/kernel
f
v/kernel/Read/ReadVariableOpReadVariableOpv/kernel*
_output_shapes
:	*
dtype0
d
v/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namev/bias
]
v/bias/Read/ReadVariableOpReadVariableOpv/bias*
_output_shapes
:*
dtype0

Adam/conv2d_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_4/kernel/m

*Adam/conv2d_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_4/kernel/m*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_6/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_6/gamma/m

6Adam/batch_normalization_6/gamma/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_6/gamma/m*
_output_shapes
:*
dtype0

!Adam/batch_normalization_6/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_6/beta/m

5Adam/batch_normalization_6/beta/m/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_6/beta/m*
_output_shapes
:*
dtype0

Adam/conv2d_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_5/kernel/m

*Adam/conv2d_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_5/kernel/m*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_7/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_7/gamma/m

6Adam/batch_normalization_7/gamma/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_7/gamma/m*
_output_shapes
:*
dtype0

!Adam/batch_normalization_7/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_7/beta/m

5Adam/batch_normalization_7/beta/m/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_7/beta/m*
_output_shapes
:*
dtype0

Adam/conv2d_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_6/kernel/m

*Adam/conv2d_6/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_6/kernel/m*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_8/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_8/gamma/m

6Adam/batch_normalization_8/gamma/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_8/gamma/m*
_output_shapes
:*
dtype0

!Adam/batch_normalization_8/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_8/beta/m

5Adam/batch_normalization_8/beta/m/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_8/beta/m*
_output_shapes
:*
dtype0

Adam/conv2d_7/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_7/kernel/m

*Adam/conv2d_7/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_7/kernel/m*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_9/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_9/gamma/m

6Adam/batch_normalization_9/gamma/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_9/gamma/m*
_output_shapes
:*
dtype0

!Adam/batch_normalization_9/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_9/beta/m

5Adam/batch_normalization_9/beta/m/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_9/beta/m*
_output_shapes
:*
dtype0

Adam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
À*&
shared_nameAdam/dense_2/kernel/m

)Adam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/m* 
_output_shapes
:
À*
dtype0

#Adam/batch_normalization_10/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/batch_normalization_10/gamma/m

7Adam/batch_normalization_10/gamma/m/Read/ReadVariableOpReadVariableOp#Adam/batch_normalization_10/gamma/m*
_output_shapes	
:*
dtype0

"Adam/batch_normalization_10/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_10/beta/m

6Adam/batch_normalization_10/beta/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_10/beta/m*
_output_shapes	
:*
dtype0

Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/dense_3/kernel/m

)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m* 
_output_shapes
:
*
dtype0

#Adam/batch_normalization_11/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/batch_normalization_11/gamma/m

7Adam/batch_normalization_11/gamma/m/Read/ReadVariableOpReadVariableOp#Adam/batch_normalization_11/gamma/m*
_output_shapes	
:*
dtype0

"Adam/batch_normalization_11/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_11/beta/m

6Adam/batch_normalization_11/beta/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_11/beta/m*
_output_shapes	
:*
dtype0
~
Adam/pi/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
 *!
shared_nameAdam/pi/kernel/m
w
$Adam/pi/kernel/m/Read/ReadVariableOpReadVariableOpAdam/pi/kernel/m* 
_output_shapes
:
 *
dtype0
u
Adam/pi/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/pi/bias/m
n
"Adam/pi/bias/m/Read/ReadVariableOpReadVariableOpAdam/pi/bias/m*
_output_shapes	
: *
dtype0
{
Adam/v/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	* 
shared_nameAdam/v/kernel/m
t
#Adam/v/kernel/m/Read/ReadVariableOpReadVariableOpAdam/v/kernel/m*
_output_shapes
:	*
dtype0
r
Adam/v/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameAdam/v/bias/m
k
!Adam/v/bias/m/Read/ReadVariableOpReadVariableOpAdam/v/bias/m*
_output_shapes
:*
dtype0

Adam/conv2d_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_4/kernel/v

*Adam/conv2d_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_4/kernel/v*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_6/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_6/gamma/v

6Adam/batch_normalization_6/gamma/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_6/gamma/v*
_output_shapes
:*
dtype0

!Adam/batch_normalization_6/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_6/beta/v

5Adam/batch_normalization_6/beta/v/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_6/beta/v*
_output_shapes
:*
dtype0

Adam/conv2d_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_5/kernel/v

*Adam/conv2d_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_5/kernel/v*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_7/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_7/gamma/v

6Adam/batch_normalization_7/gamma/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_7/gamma/v*
_output_shapes
:*
dtype0

!Adam/batch_normalization_7/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_7/beta/v

5Adam/batch_normalization_7/beta/v/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_7/beta/v*
_output_shapes
:*
dtype0

Adam/conv2d_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_6/kernel/v

*Adam/conv2d_6/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_6/kernel/v*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_8/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_8/gamma/v

6Adam/batch_normalization_8/gamma/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_8/gamma/v*
_output_shapes
:*
dtype0

!Adam/batch_normalization_8/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_8/beta/v

5Adam/batch_normalization_8/beta/v/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_8/beta/v*
_output_shapes
:*
dtype0

Adam/conv2d_7/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv2d_7/kernel/v

*Adam/conv2d_7/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_7/kernel/v*&
_output_shapes
:*
dtype0

"Adam/batch_normalization_9/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_9/gamma/v

6Adam/batch_normalization_9/gamma/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_9/gamma/v*
_output_shapes
:*
dtype0

!Adam/batch_normalization_9/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/batch_normalization_9/beta/v

5Adam/batch_normalization_9/beta/v/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_9/beta/v*
_output_shapes
:*
dtype0

Adam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
À*&
shared_nameAdam/dense_2/kernel/v

)Adam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/v* 
_output_shapes
:
À*
dtype0

#Adam/batch_normalization_10/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/batch_normalization_10/gamma/v

7Adam/batch_normalization_10/gamma/v/Read/ReadVariableOpReadVariableOp#Adam/batch_normalization_10/gamma/v*
_output_shapes	
:*
dtype0

"Adam/batch_normalization_10/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_10/beta/v

6Adam/batch_normalization_10/beta/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_10/beta/v*
_output_shapes	
:*
dtype0

Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/dense_3/kernel/v

)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v* 
_output_shapes
:
*
dtype0

#Adam/batch_normalization_11/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/batch_normalization_11/gamma/v

7Adam/batch_normalization_11/gamma/v/Read/ReadVariableOpReadVariableOp#Adam/batch_normalization_11/gamma/v*
_output_shapes	
:*
dtype0

"Adam/batch_normalization_11/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Adam/batch_normalization_11/beta/v

6Adam/batch_normalization_11/beta/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_11/beta/v*
_output_shapes	
:*
dtype0
~
Adam/pi/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
 *!
shared_nameAdam/pi/kernel/v
w
$Adam/pi/kernel/v/Read/ReadVariableOpReadVariableOpAdam/pi/kernel/v* 
_output_shapes
:
 *
dtype0
u
Adam/pi/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/pi/bias/v
n
"Adam/pi/bias/v/Read/ReadVariableOpReadVariableOpAdam/pi/bias/v*
_output_shapes	
: *
dtype0
{
Adam/v/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	* 
shared_nameAdam/v/kernel/v
t
#Adam/v/kernel/v/Read/ReadVariableOpReadVariableOpAdam/v/kernel/v*
_output_shapes
:	*
dtype0
r
Adam/v/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameAdam/v/bias/v
k
!Adam/v/bias/v/Read/ReadVariableOpReadVariableOpAdam/v/bias/v*
_output_shapes
:*
dtype0
J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ÈB

NoOpNoOp
îÍ
Const_1Const"/device:CPU:0*
_output_shapes
: *
dtype0*¦Í
valueÍBÍ BÍ

	model
	optimizer

checkpoint
__call__
reset_optimizer
save_checkpoint

train_step
validate_step
	
signatures*

	
model
	keras_api*

iter

beta_1

beta_2
	decay
learning_rate5má=mâ>mãMmäUmåVmæemçmmènmé}mê	më	mì	mí	£mî	¤mï	ºmð	Âmñ	Ãmò	Ùmó	Úmô	ámõ	âmö5v÷=vø>vùMvúUvûVvüevýmvþnvÿ}v	v	v	v	£v	¤v	ºv	Âv	Ãv	Ùv	Úv	áv	âv*
 
root
save_counter*
* 
* 
* 
* 
* 
}
chessnet_serve
chessnet_train
chessnet_validate
chessnet_save_checkpoint
chessnet_reset_optimizer* 
Æ
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer_with_weights-4
layer-7
layer_with_weights-5
layer-8
 layer-9
!layer_with_weights-6
!layer-10
"layer_with_weights-7
"layer-11
#layer-12
$layer-13
%layer_with_weights-8
%layer-14
&layer_with_weights-9
&layer-15
'layer-16
(layer-17
)layer_with_weights-10
)layer-18
*layer_with_weights-11
*layer-19
+layer-20
,layer-21
-layer_with_weights-12
-layer-22
.layer_with_weights-13
.layer-23
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses*
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUEsave_counter2checkpoint/save_counter/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 


5kernel
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses*
Õ
<axis
	=gamma
>beta
?moving_mean
@moving_variance
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
E__call__
*F&call_and_return_all_conditional_losses*

G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
K__call__
*L&call_and_return_all_conditional_losses* 


Mkernel
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses*
Õ
Taxis
	Ugamma
Vbeta
Wmoving_mean
Xmoving_variance
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
]__call__
*^&call_and_return_all_conditional_losses*

_	variables
`trainable_variables
aregularization_losses
b	keras_api
c__call__
*d&call_and_return_all_conditional_losses* 


ekernel
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses*
Õ
laxis
	mgamma
nbeta
omoving_mean
pmoving_variance
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses*

w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses* 
 

}kernel
~	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*
à
	axis

gamma
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses* 

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses* 
£
kernel
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
+¡&call_and_return_all_conditional_losses*
à
	¢axis

£gamma
	¤beta
¥moving_mean
¦moving_variance
§	variables
¨trainable_variables
©regularization_losses
ª	keras_api
«__call__
+¬&call_and_return_all_conditional_losses*

­	variables
®trainable_variables
¯regularization_losses
°	keras_api
±__call__
+²&call_and_return_all_conditional_losses* 
¬
³	variables
´trainable_variables
µregularization_losses
¶	keras_api
·_random_generator
¸__call__
+¹&call_and_return_all_conditional_losses* 
£
ºkernel
»	variables
¼trainable_variables
½regularization_losses
¾	keras_api
¿__call__
+À&call_and_return_all_conditional_losses*
à
	Áaxis

Âgamma
	Ãbeta
Ämoving_mean
Åmoving_variance
Æ	variables
Çtrainable_variables
Èregularization_losses
É	keras_api
Ê__call__
+Ë&call_and_return_all_conditional_losses*

Ì	variables
Ítrainable_variables
Îregularization_losses
Ï	keras_api
Ð__call__
+Ñ&call_and_return_all_conditional_losses* 
¬
Ò	variables
Ótrainable_variables
Ôregularization_losses
Õ	keras_api
Ö_random_generator
×__call__
+Ø&call_and_return_all_conditional_losses* 
®
Ùkernel
	Úbias
Û	variables
Ütrainable_variables
Ýregularization_losses
Þ	keras_api
ß__call__
+à&call_and_return_all_conditional_losses*
®
ákernel
	âbias
ã	variables
ätrainable_variables
åregularization_losses
æ	keras_api
ç__call__
+è&call_and_return_all_conditional_losses*

50
=1
>2
?3
@4
M5
U6
V7
W8
X9
e10
m11
n12
o13
p14
}15
16
17
18
19
20
£21
¤22
¥23
¦24
º25
Â26
Ã27
Ä28
Å29
Ù30
Ú31
á32
â33*
¶
50
=1
>2
M3
U4
V5
e6
m7
n8
}9
10
11
12
£13
¤14
º15
Â16
Ã17
Ù18
Ú19
á20
â21*
* 

énon_trainable_variables
êlayers
ëmetrics
 ìlayer_regularization_losses
ílayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*
* 
* 
ke
VARIABLE_VALUEconv2d_4/kernelBmodel/model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*

50*

50*
* 

înon_trainable_variables
ïlayers
ðmetrics
 ñlayer_regularization_losses
òlayer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses*
* 
* 
* 
vp
VARIABLE_VALUEbatch_normalization_6/gammaAmodel/model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUEbatch_normalization_6/beta@model/model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE!batch_normalization_6/moving_meanGmodel/model/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE%batch_normalization_6/moving_varianceKmodel/model/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
 
=0
>1
?2
@3*

=0
>1*
* 

ónon_trainable_variables
ôlayers
õmetrics
 ölayer_regularization_losses
÷layer_metrics
A	variables
Btrainable_variables
Cregularization_losses
E__call__
*F&call_and_return_all_conditional_losses
&F"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

ønon_trainable_variables
ùlayers
úmetrics
 ûlayer_regularization_losses
ülayer_metrics
G	variables
Htrainable_variables
Iregularization_losses
K__call__
*L&call_and_return_all_conditional_losses
&L"call_and_return_conditional_losses* 
* 
* 
ke
VARIABLE_VALUEconv2d_5/kernelBmodel/model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*

M0*

M0*
* 

ýnon_trainable_variables
þlayers
ÿmetrics
 layer_regularization_losses
layer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses*
* 
* 
* 
vp
VARIABLE_VALUEbatch_normalization_7/gammaAmodel/model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUEbatch_normalization_7/beta@model/model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE!batch_normalization_7/moving_meanGmodel/model/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE%batch_normalization_7/moving_varianceKmodel/model/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
 
U0
V1
W2
X3*

U0
V1*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Y	variables
Ztrainable_variables
[regularization_losses
]__call__
*^&call_and_return_all_conditional_losses
&^"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
_	variables
`trainable_variables
aregularization_losses
c__call__
*d&call_and_return_all_conditional_losses
&d"call_and_return_conditional_losses* 
* 
* 
ke
VARIABLE_VALUEconv2d_6/kernelBmodel/model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*

e0*

e0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses*
* 
* 
* 
vp
VARIABLE_VALUEbatch_normalization_8/gammaAmodel/model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUEbatch_normalization_8/beta@model/model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE!batch_normalization_8/moving_meanGmodel/model/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE%batch_normalization_8/moving_varianceKmodel/model/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
 
m0
n1
o2
p3*

m0
n1*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses* 
* 
* 
ke
VARIABLE_VALUEconv2d_7/kernelBmodel/model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*

}0*

}0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
~	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
vp
VARIABLE_VALUEbatch_normalization_9/gammaAmodel/model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUEbatch_normalization_9/beta@model/model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE!batch_normalization_9/moving_meanGmodel/model/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE%batch_normalization_9/moving_varianceKmodel/model/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
$
0
1
2
3*

0
1*
* 

 non_trainable_variables
¡layers
¢metrics
 £layer_regularization_losses
¤layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

¥non_trainable_variables
¦layers
§metrics
 ¨layer_regularization_losses
©layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 

ªnon_trainable_variables
«layers
¬metrics
 ­layer_regularization_losses
®layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 
* 
* 
jd
VARIABLE_VALUEdense_2/kernelBmodel/model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*

0*

0*
* 

¯non_trainable_variables
°layers
±metrics
 ²layer_regularization_losses
³layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
+¡&call_and_return_all_conditional_losses
'¡"call_and_return_conditional_losses*
* 
* 
* 
wq
VARIABLE_VALUEbatch_normalization_10/gammaAmodel/model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUE*
uo
VARIABLE_VALUEbatch_normalization_10/beta@model/model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUE"batch_normalization_10/moving_meanGmodel/model/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_10/moving_varianceKmodel/model/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
$
£0
¤1
¥2
¦3*

£0
¤1*
* 

´non_trainable_variables
µlayers
¶metrics
 ·layer_regularization_losses
¸layer_metrics
§	variables
¨trainable_variables
©regularization_losses
«__call__
+¬&call_and_return_all_conditional_losses
'¬"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

¹non_trainable_variables
ºlayers
»metrics
 ¼layer_regularization_losses
½layer_metrics
­	variables
®trainable_variables
¯regularization_losses
±__call__
+²&call_and_return_all_conditional_losses
'²"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 

¾non_trainable_variables
¿layers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
³	variables
´trainable_variables
µregularization_losses
¸__call__
+¹&call_and_return_all_conditional_losses
'¹"call_and_return_conditional_losses* 
* 
* 
* 
ke
VARIABLE_VALUEdense_3/kernelCmodel/model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUE*

º0*

º0*
* 

Ãnon_trainable_variables
Älayers
Åmetrics
 Ælayer_regularization_losses
Çlayer_metrics
»	variables
¼trainable_variables
½regularization_losses
¿__call__
+À&call_and_return_all_conditional_losses
'À"call_and_return_conditional_losses*
* 
* 
* 
xr
VARIABLE_VALUEbatch_normalization_11/gammaBmodel/model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUEbatch_normalization_11/betaAmodel/model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE"batch_normalization_11/moving_meanHmodel/model/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_11/moving_varianceLmodel/model/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
$
Â0
Ã1
Ä2
Å3*

Â0
Ã1*
* 

Ènon_trainable_variables
Élayers
Êmetrics
 Ëlayer_regularization_losses
Ìlayer_metrics
Æ	variables
Çtrainable_variables
Èregularization_losses
Ê__call__
+Ë&call_and_return_all_conditional_losses
'Ë"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

Ínon_trainable_variables
Îlayers
Ïmetrics
 Ðlayer_regularization_losses
Ñlayer_metrics
Ì	variables
Ítrainable_variables
Îregularization_losses
Ð__call__
+Ñ&call_and_return_all_conditional_losses
'Ñ"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 

Ònon_trainable_variables
Ólayers
Ômetrics
 Õlayer_regularization_losses
Ölayer_metrics
Ò	variables
Ótrainable_variables
Ôregularization_losses
×__call__
+Ø&call_and_return_all_conditional_losses
'Ø"call_and_return_conditional_losses* 
* 
* 
* 
f`
VARIABLE_VALUE	pi/kernelCmodel/model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEpi/biasAmodel/model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUE*

Ù0
Ú1*

Ù0
Ú1*
* 

×non_trainable_variables
Ølayers
Ùmetrics
 Úlayer_regularization_losses
Ûlayer_metrics
Û	variables
Ütrainable_variables
Ýregularization_losses
ß__call__
+à&call_and_return_all_conditional_losses
'à"call_and_return_conditional_losses*
* 
* 
e_
VARIABLE_VALUEv/kernelCmodel/model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEv/biasAmodel/model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUE*

á0
â1*

á0
â1*
* 

Ünon_trainable_variables
Ýlayers
Þmetrics
 ßlayer_regularization_losses
àlayer_metrics
ã	variables
ätrainable_variables
åregularization_losses
ç__call__
+è&call_and_return_all_conditional_losses
'è"call_and_return_conditional_losses*
* 
* 
`
?0
@1
W2
X3
o4
p5
6
7
¥8
¦9
Ä10
Å11*
º
0
1
2
3
4
5
6
7
8
 9
!10
"11
#12
$13
%14
&15
'16
(17
)18
*19
+20
,21
-22
.23*
* 
* 
* 
* 
* 
* 
* 
* 

?0
@1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

W0
X1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

o0
p1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

¥0
¦1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

Ä0
Å1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

VARIABLE_VALUEAdam/conv2d_4/kernel/m^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_6/gamma/m]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_6/beta/m\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_5/kernel/m^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_7/gamma/m]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_7/beta/m\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_6/kernel/m^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_8/gamma/m]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_8/beta/m\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_7/kernel/m^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_9/gamma/m]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_9/beta/m\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/dense_2/kernel/m^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/batch_normalization_10/gamma/m]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_10/beta/m\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/dense_3/kernel/m_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/batch_normalization_11/gamma/m^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_11/beta/m]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/pi/kernel/m_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/pi/bias/m]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/v/kernel/m_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUEAdam/v/bias/m]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_4/kernel/v^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_6/gamma/v]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_6/beta/v\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_5/kernel/v^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_7/gamma/v]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_7/beta/v\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_6/kernel/v^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_8/gamma/v]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_8/beta/v\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/conv2d_7/kernel/v^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_9/gamma/v]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE!Adam/batch_normalization_9/beta/v\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/dense_2/kernel/v^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/batch_normalization_10/gamma/v]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_10/beta/v\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/dense_3/kernel/v_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/batch_normalization_11/gamma/v^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE"Adam/batch_normalization_11/beta/v]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/pi/kernel/v_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/pi/bias/v]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/v/kernel/v_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUEAdam/v/bias/v]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
a
 chessnet_reset_optimizer_optionsPlaceholder*
_output_shapes
: *
dtype0*
shape: 
Ú
StatefulPartitionedCallStatefulPartitionedCall chessnet_reset_optimizer_options	Adam/iterAdam/conv2d_4/kernel/m"Adam/batch_normalization_6/gamma/m!Adam/batch_normalization_6/beta/mAdam/conv2d_5/kernel/m"Adam/batch_normalization_7/gamma/m!Adam/batch_normalization_7/beta/mAdam/conv2d_6/kernel/m"Adam/batch_normalization_8/gamma/m!Adam/batch_normalization_8/beta/mAdam/conv2d_7/kernel/m"Adam/batch_normalization_9/gamma/m!Adam/batch_normalization_9/beta/mAdam/dense_2/kernel/m#Adam/batch_normalization_10/gamma/m"Adam/batch_normalization_10/beta/mAdam/dense_3/kernel/m#Adam/batch_normalization_11/gamma/m"Adam/batch_normalization_11/beta/mAdam/pi/kernel/mAdam/pi/bias/mAdam/v/kernel/mAdam/v/bias/mAdam/conv2d_4/kernel/v"Adam/batch_normalization_6/gamma/v!Adam/batch_normalization_6/beta/vAdam/conv2d_5/kernel/v"Adam/batch_normalization_7/gamma/v!Adam/batch_normalization_7/beta/vAdam/conv2d_6/kernel/v"Adam/batch_normalization_8/gamma/v!Adam/batch_normalization_8/beta/vAdam/conv2d_7/kernel/v"Adam/batch_normalization_9/gamma/v!Adam/batch_normalization_9/beta/vAdam/dense_2/kernel/v#Adam/batch_normalization_10/gamma/v"Adam/batch_normalization_10/beta/vAdam/dense_3/kernel/v#Adam/batch_normalization_11/gamma/v"Adam/batch_normalization_11/beta/vAdam/pi/kernel/vAdam/pi/bias/vAdam/v/kernel/vAdam/v/bias/v*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_3111
^
chessnet_save_checkpoint_pathPlaceholder*
_output_shapes
: *
dtype0*
shape: 


StatefulPartitionedCall_1StatefulPartitionedCallchessnet_save_checkpoint_pathconv2d_4/kernelbatch_normalization_6/gammabatch_normalization_6/beta!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_5/kernelbatch_normalization_7/gammabatch_normalization_7/beta!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_6/kernelbatch_normalization_8/gammabatch_normalization_8/beta!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_7/kernelbatch_normalization_9/gammabatch_normalization_9/beta!batch_normalization_9/moving_mean%batch_normalization_9/moving_variancedense_2/kernelbatch_normalization_10/gammabatch_normalization_10/beta"batch_normalization_10/moving_mean&batch_normalization_10/moving_variancedense_3/kernelbatch_normalization_11/gammabatch_normalization_11/beta"batch_normalization_11/moving_mean&batch_normalization_11/moving_variance	pi/kernelpi/biasv/kernelv/bias*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: *D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_3014

chessnet_serve_xPlaceholder*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*$
shape:ÿÿÿÿÿÿÿÿÿ
¨

StatefulPartitionedCall_2StatefulPartitionedCallchessnet_serve_xconv2d_4/kernelbatch_normalization_6/gammabatch_normalization_6/beta!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_5/kernelbatch_normalization_7/gammabatch_normalization_7/beta!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_6/kernelbatch_normalization_8/gammabatch_normalization_8/beta!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_7/kernelbatch_normalization_9/gammabatch_normalization_9/beta!batch_normalization_9/moving_mean%batch_normalization_9/moving_variancedense_2/kernel&batch_normalization_10/moving_variancebatch_normalization_10/gamma"batch_normalization_10/moving_meanbatch_normalization_10/betadense_3/kernel&batch_normalization_11/moving_variancebatch_normalization_11/gamma"batch_normalization_11/moving_meanbatch_normalization_11/betav/kernelv/bias	pi/kernelpi/bias*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_2677
v
chessnet_train_piPlaceholder*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ 
k
chessnet_train_vPlaceholder*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ

chessnet_train_xPlaceholder*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*$
shape:ÿÿÿÿÿÿÿÿÿ

StatefulPartitionedCall_3StatefulPartitionedCallchessnet_train_pichessnet_train_vchessnet_train_xconv2d_4/kernelbatch_normalization_6/gammabatch_normalization_6/beta!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_5/kernelbatch_normalization_7/gammabatch_normalization_7/beta!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_6/kernelbatch_normalization_8/gammabatch_normalization_8/beta!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_7/kernelbatch_normalization_9/gammabatch_normalization_9/beta!batch_normalization_9/moving_mean%batch_normalization_9/moving_variancedense_2/kernel&batch_normalization_10/moving_variancebatch_normalization_10/gamma"batch_normalization_10/moving_meanbatch_normalization_10/betadense_3/kernel&batch_normalization_11/moving_variancebatch_normalization_11/gamma"batch_normalization_11/moving_meanbatch_normalization_11/betav/kernelv/bias	pi/kernelpi/biasConstAdam/learning_rate	Adam/iterAdam/beta_1Adam/beta_2Adam/conv2d_4/kernel/mAdam/conv2d_4/kernel/v"Adam/batch_normalization_6/gamma/m"Adam/batch_normalization_6/gamma/v!Adam/batch_normalization_6/beta/m!Adam/batch_normalization_6/beta/vAdam/conv2d_5/kernel/mAdam/conv2d_5/kernel/v"Adam/batch_normalization_7/gamma/m"Adam/batch_normalization_7/gamma/v!Adam/batch_normalization_7/beta/m!Adam/batch_normalization_7/beta/vAdam/conv2d_6/kernel/mAdam/conv2d_6/kernel/v"Adam/batch_normalization_8/gamma/m"Adam/batch_normalization_8/gamma/v!Adam/batch_normalization_8/beta/m!Adam/batch_normalization_8/beta/vAdam/conv2d_7/kernel/mAdam/conv2d_7/kernel/v"Adam/batch_normalization_9/gamma/m"Adam/batch_normalization_9/gamma/v!Adam/batch_normalization_9/beta/m!Adam/batch_normalization_9/beta/vAdam/dense_2/kernel/mAdam/dense_2/kernel/v#Adam/batch_normalization_10/gamma/m#Adam/batch_normalization_10/gamma/v"Adam/batch_normalization_10/beta/m"Adam/batch_normalization_10/beta/vAdam/dense_3/kernel/mAdam/dense_3/kernel/v#Adam/batch_normalization_11/gamma/m#Adam/batch_normalization_11/gamma/v"Adam/batch_normalization_11/beta/m"Adam/batch_normalization_11/beta/vAdam/pi/kernel/mAdam/pi/kernel/vAdam/pi/bias/mAdam/pi/bias/vAdam/v/kernel/mAdam/v/kernel/vAdam/v/bias/mAdam/v/bias/v*a
TinZ
X2V*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: : : *1
_read_only_resource_inputs
&()*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_2856
y
chessnet_validate_piPlaceholder*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ 
n
chessnet_validate_vPlaceholder*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ

chessnet_validate_xPlaceholder*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*$
shape:ÿÿÿÿÿÿÿÿÿ
À

StatefulPartitionedCall_4StatefulPartitionedCallchessnet_validate_pichessnet_validate_vchessnet_validate_xconv2d_4/kernelbatch_normalization_6/gammabatch_normalization_6/beta!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_5/kernelbatch_normalization_7/gammabatch_normalization_7/beta!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_6/kernelbatch_normalization_8/gammabatch_normalization_8/beta!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_7/kernelbatch_normalization_9/gammabatch_normalization_9/beta!batch_normalization_9/moving_mean%batch_normalization_9/moving_variancedense_2/kernel&batch_normalization_10/moving_variancebatch_normalization_10/gamma"batch_normalization_10/moving_meanbatch_normalization_10/betadense_3/kernel&batch_normalization_11/moving_variancebatch_normalization_11/gamma"batch_normalization_11/moving_meanbatch_normalization_11/betav/kernelv/bias	pi/kernelpi/biasConst*1
Tin*
(2&*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: : : *D
_read_only_resource_inputs&
$"	
 !"#$*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_2939
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ò!
StatefulPartitionedCall_5StatefulPartitionedCallsaver_filenameAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp save_counter/Read/ReadVariableOp#conv2d_4/kernel/Read/ReadVariableOp/batch_normalization_6/gamma/Read/ReadVariableOp.batch_normalization_6/beta/Read/ReadVariableOp5batch_normalization_6/moving_mean/Read/ReadVariableOp9batch_normalization_6/moving_variance/Read/ReadVariableOp#conv2d_5/kernel/Read/ReadVariableOp/batch_normalization_7/gamma/Read/ReadVariableOp.batch_normalization_7/beta/Read/ReadVariableOp5batch_normalization_7/moving_mean/Read/ReadVariableOp9batch_normalization_7/moving_variance/Read/ReadVariableOp#conv2d_6/kernel/Read/ReadVariableOp/batch_normalization_8/gamma/Read/ReadVariableOp.batch_normalization_8/beta/Read/ReadVariableOp5batch_normalization_8/moving_mean/Read/ReadVariableOp9batch_normalization_8/moving_variance/Read/ReadVariableOp#conv2d_7/kernel/Read/ReadVariableOp/batch_normalization_9/gamma/Read/ReadVariableOp.batch_normalization_9/beta/Read/ReadVariableOp5batch_normalization_9/moving_mean/Read/ReadVariableOp9batch_normalization_9/moving_variance/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp0batch_normalization_10/gamma/Read/ReadVariableOp/batch_normalization_10/beta/Read/ReadVariableOp6batch_normalization_10/moving_mean/Read/ReadVariableOp:batch_normalization_10/moving_variance/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp0batch_normalization_11/gamma/Read/ReadVariableOp/batch_normalization_11/beta/Read/ReadVariableOp6batch_normalization_11/moving_mean/Read/ReadVariableOp:batch_normalization_11/moving_variance/Read/ReadVariableOppi/kernel/Read/ReadVariableOppi/bias/Read/ReadVariableOpv/kernel/Read/ReadVariableOpv/bias/Read/ReadVariableOp*Adam/conv2d_4/kernel/m/Read/ReadVariableOp6Adam/batch_normalization_6/gamma/m/Read/ReadVariableOp5Adam/batch_normalization_6/beta/m/Read/ReadVariableOp*Adam/conv2d_5/kernel/m/Read/ReadVariableOp6Adam/batch_normalization_7/gamma/m/Read/ReadVariableOp5Adam/batch_normalization_7/beta/m/Read/ReadVariableOp*Adam/conv2d_6/kernel/m/Read/ReadVariableOp6Adam/batch_normalization_8/gamma/m/Read/ReadVariableOp5Adam/batch_normalization_8/beta/m/Read/ReadVariableOp*Adam/conv2d_7/kernel/m/Read/ReadVariableOp6Adam/batch_normalization_9/gamma/m/Read/ReadVariableOp5Adam/batch_normalization_9/beta/m/Read/ReadVariableOp)Adam/dense_2/kernel/m/Read/ReadVariableOp7Adam/batch_normalization_10/gamma/m/Read/ReadVariableOp6Adam/batch_normalization_10/beta/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp7Adam/batch_normalization_11/gamma/m/Read/ReadVariableOp6Adam/batch_normalization_11/beta/m/Read/ReadVariableOp$Adam/pi/kernel/m/Read/ReadVariableOp"Adam/pi/bias/m/Read/ReadVariableOp#Adam/v/kernel/m/Read/ReadVariableOp!Adam/v/bias/m/Read/ReadVariableOp*Adam/conv2d_4/kernel/v/Read/ReadVariableOp6Adam/batch_normalization_6/gamma/v/Read/ReadVariableOp5Adam/batch_normalization_6/beta/v/Read/ReadVariableOp*Adam/conv2d_5/kernel/v/Read/ReadVariableOp6Adam/batch_normalization_7/gamma/v/Read/ReadVariableOp5Adam/batch_normalization_7/beta/v/Read/ReadVariableOp*Adam/conv2d_6/kernel/v/Read/ReadVariableOp6Adam/batch_normalization_8/gamma/v/Read/ReadVariableOp5Adam/batch_normalization_8/beta/v/Read/ReadVariableOp*Adam/conv2d_7/kernel/v/Read/ReadVariableOp6Adam/batch_normalization_9/gamma/v/Read/ReadVariableOp5Adam/batch_normalization_9/beta/v/Read/ReadVariableOp)Adam/dense_2/kernel/v/Read/ReadVariableOp7Adam/batch_normalization_10/gamma/v/Read/ReadVariableOp6Adam/batch_normalization_10/beta/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp7Adam/batch_normalization_11/gamma/v/Read/ReadVariableOp6Adam/batch_normalization_11/beta/v/Read/ReadVariableOp$Adam/pi/kernel/v/Read/ReadVariableOp"Adam/pi/bias/v/Read/ReadVariableOp#Adam/v/kernel/v/Read/ReadVariableOp!Adam/v/bias/v/Read/ReadVariableOpConst_1*a
TinZ
X2V		*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *&
f!R
__inference__traced_save_7255
Û
StatefulPartitionedCall_6StatefulPartitionedCallsaver_filename	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratesave_counterconv2d_4/kernelbatch_normalization_6/gammabatch_normalization_6/beta!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_5/kernelbatch_normalization_7/gammabatch_normalization_7/beta!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_6/kernelbatch_normalization_8/gammabatch_normalization_8/beta!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_7/kernelbatch_normalization_9/gammabatch_normalization_9/beta!batch_normalization_9/moving_mean%batch_normalization_9/moving_variancedense_2/kernelbatch_normalization_10/gammabatch_normalization_10/beta"batch_normalization_10/moving_mean&batch_normalization_10/moving_variancedense_3/kernelbatch_normalization_11/gammabatch_normalization_11/beta"batch_normalization_11/moving_mean&batch_normalization_11/moving_variance	pi/kernelpi/biasv/kernelv/biasAdam/conv2d_4/kernel/m"Adam/batch_normalization_6/gamma/m!Adam/batch_normalization_6/beta/mAdam/conv2d_5/kernel/m"Adam/batch_normalization_7/gamma/m!Adam/batch_normalization_7/beta/mAdam/conv2d_6/kernel/m"Adam/batch_normalization_8/gamma/m!Adam/batch_normalization_8/beta/mAdam/conv2d_7/kernel/m"Adam/batch_normalization_9/gamma/m!Adam/batch_normalization_9/beta/mAdam/dense_2/kernel/m#Adam/batch_normalization_10/gamma/m"Adam/batch_normalization_10/beta/mAdam/dense_3/kernel/m#Adam/batch_normalization_11/gamma/m"Adam/batch_normalization_11/beta/mAdam/pi/kernel/mAdam/pi/bias/mAdam/v/kernel/mAdam/v/bias/mAdam/conv2d_4/kernel/v"Adam/batch_normalization_6/gamma/v!Adam/batch_normalization_6/beta/vAdam/conv2d_5/kernel/v"Adam/batch_normalization_7/gamma/v!Adam/batch_normalization_7/beta/vAdam/conv2d_6/kernel/v"Adam/batch_normalization_8/gamma/v!Adam/batch_normalization_8/beta/vAdam/conv2d_7/kernel/v"Adam/batch_normalization_9/gamma/v!Adam/batch_normalization_9/beta/vAdam/dense_2/kernel/v#Adam/batch_normalization_10/gamma/v"Adam/batch_normalization_10/beta/vAdam/dense_3/kernel/v#Adam/batch_normalization_11/gamma/v"Adam/batch_normalization_11/beta/vAdam/pi/kernel/vAdam/pi/bias/vAdam/v/kernel/vAdam/v/bias/v*`
TinY
W2U*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__traced_restore_7517í,
¾

'__inference_conv2d_6_layer_call_fn_6212

inputs!
unknown:
identity¢StatefulPartitionedCallÒ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
µ
@
__inference_train_step_4028
x
pi
vI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
mul_1_x+
!adam_cast_readvariableop_resource: &
adam_readvariableop_resource:	 -
#adam_cast_2_readvariableop_resource: -
#adam_cast_3_readvariableop_resource: >
$adam_adam_update_resourceapplyadam_m:>
$adam_adam_update_resourceapplyadam_v:4
&adam_adam_update_1_resourceapplyadam_m:4
&adam_adam_update_1_resourceapplyadam_v:4
&adam_adam_update_2_resourceapplyadam_m:4
&adam_adam_update_2_resourceapplyadam_v:@
&adam_adam_update_3_resourceapplyadam_m:@
&adam_adam_update_3_resourceapplyadam_v:4
&adam_adam_update_4_resourceapplyadam_m:4
&adam_adam_update_4_resourceapplyadam_v:4
&adam_adam_update_5_resourceapplyadam_m:4
&adam_adam_update_5_resourceapplyadam_v:@
&adam_adam_update_6_resourceapplyadam_m:@
&adam_adam_update_6_resourceapplyadam_v:4
&adam_adam_update_7_resourceapplyadam_m:4
&adam_adam_update_7_resourceapplyadam_v:4
&adam_adam_update_8_resourceapplyadam_m:4
&adam_adam_update_8_resourceapplyadam_v:@
&adam_adam_update_9_resourceapplyadam_m:@
&adam_adam_update_9_resourceapplyadam_v:5
'adam_adam_update_10_resourceapplyadam_m:5
'adam_adam_update_10_resourceapplyadam_v:5
'adam_adam_update_11_resourceapplyadam_m:5
'adam_adam_update_11_resourceapplyadam_v:;
'adam_adam_update_12_resourceapplyadam_m:
À;
'adam_adam_update_12_resourceapplyadam_v:
À6
'adam_adam_update_13_resourceapplyadam_m:	6
'adam_adam_update_13_resourceapplyadam_v:	6
'adam_adam_update_14_resourceapplyadam_m:	6
'adam_adam_update_14_resourceapplyadam_v:	;
'adam_adam_update_15_resourceapplyadam_m:
;
'adam_adam_update_15_resourceapplyadam_v:
6
'adam_adam_update_16_resourceapplyadam_m:	6
'adam_adam_update_16_resourceapplyadam_v:	6
'adam_adam_update_17_resourceapplyadam_m:	6
'adam_adam_update_17_resourceapplyadam_v:	;
'adam_adam_update_18_resourceapplyadam_m:
 ;
'adam_adam_update_18_resourceapplyadam_v:
 6
'adam_adam_update_19_resourceapplyadam_m:	 6
'adam_adam_update_19_resourceapplyadam_v:	 :
'adam_adam_update_20_resourceapplyadam_m:	:
'adam_adam_update_20_resourceapplyadam_v:	5
'adam_adam_update_21_resourceapplyadam_m:5
'adam_adam_update_21_resourceapplyadam_v:
identity

identity_1

identity_2¢Adam/Adam/AssignAddVariableOp¢"Adam/Adam/update/ResourceApplyAdam¢$Adam/Adam/update_1/ResourceApplyAdam¢%Adam/Adam/update_10/ResourceApplyAdam¢%Adam/Adam/update_11/ResourceApplyAdam¢%Adam/Adam/update_12/ResourceApplyAdam¢%Adam/Adam/update_13/ResourceApplyAdam¢%Adam/Adam/update_14/ResourceApplyAdam¢%Adam/Adam/update_15/ResourceApplyAdam¢%Adam/Adam/update_16/ResourceApplyAdam¢%Adam/Adam/update_17/ResourceApplyAdam¢%Adam/Adam/update_18/ResourceApplyAdam¢%Adam/Adam/update_19/ResourceApplyAdam¢$Adam/Adam/update_2/ResourceApplyAdam¢%Adam/Adam/update_20/ResourceApplyAdam¢%Adam/Adam/update_21/ResourceApplyAdam¢$Adam/Adam/update_3/ResourceApplyAdam¢$Adam/Adam/update_4/ResourceApplyAdam¢$Adam/Adam/update_5/ResourceApplyAdam¢$Adam/Adam/update_6/ResourceApplyAdam¢$Adam/Adam/update_7/ResourceApplyAdam¢$Adam/Adam/update_8/ResourceApplyAdam¢$Adam/Adam/update_9/ResourceApplyAdam¢Adam/Cast/ReadVariableOp¢Adam/Cast_2/ReadVariableOp¢Adam/Cast_3/ReadVariableOp¢Adam/ReadVariableOp¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ \
subSubmodel_1/v/Tanh:y:0v*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿJ
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowsub:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       F
MeanMeanpow:z:0Const:output:0*
T0*
_output_shapes
: A
NegNegpi*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [
LogLogmodel_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ O
mulMulNeg:y:0Log:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ X
Const_1Const*
_output_shapes
:*
dtype0*
valueB"       J
Mean_1Meanmul:z:0Const_1:output:0*
T0*
_output_shapes
: G
mul_1Mulmul_1_xMean_1:output:0*
T0*
_output_shapes
: G
addAddV2Mean:output:0	mul_1:z:0*
T0*
_output_shapes
: I
onesConst*
_output_shapes
: *
dtype0*
valueB
 *  ?l
gradient_tape/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ~
gradient_tape/ReshapeReshapeones:output:0$gradient_tape/Reshape/shape:output:0*
T0*
_output_shapes

:J
gradient_tape/ShapeShapepow:z:0*
T0*
_output_shapes
:
gradient_tape/TileTilegradient_tape/Reshape:output:0gradient_tape/Shape:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿL
gradient_tape/Shape_1Shapepow:z:0*
T0*
_output_shapes
:X
gradient_tape/Shape_2Const*
_output_shapes
: *
dtype0*
valueB ]
gradient_tape/ConstConst*
_output_shapes
:*
dtype0*
valueB: y
gradient_tape/ProdProdgradient_tape/Shape_1:output:0gradient_tape/Const:output:0*
T0*
_output_shapes
: _
gradient_tape/Const_1Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_1Prodgradient_tape/Shape_2:output:0gradient_tape/Const_1:output:0*
T0*
_output_shapes
: Y
gradient_tape/Maximum/yConst*
_output_shapes
: *
dtype0*
value	B :
gradient_tape/MaximumMaximumgradient_tape/Prod_1:output:0 gradient_tape/Maximum/y:output:0*
T0*
_output_shapes
: {
gradient_tape/floordivFloorDivgradient_tape/Prod:output:0gradient_tape/Maximum:z:0*
T0*
_output_shapes
: f
gradient_tape/CastCastgradient_tape/floordiv:z:0*

DstT0*

SrcT0*
_output_shapes
: 
gradient_tape/truedivRealDivgradient_tape/Tile:output:0gradient_tape/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_
gradient_tape/mul_1/MulMulones:output:0Mean_1:output:0*
T0*
_output_shapes
: Y
gradient_tape/mul_1/Mul_1Mulones:output:0mul_1_x*
T0*
_output_shapes
: 
gradient_tape/pow/mulMulgradient_tape/truediv:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\
gradient_tape/pow/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?o
gradient_tape/pow/subSubpow/y:output:0 gradient_tape/pow/sub/y:output:0*
T0*
_output_shapes
: {
gradient_tape/pow/PowPowsub:z:0gradient_tape/pow/sub:z:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
gradient_tape/pow/mul_1Mulgradient_tape/pow/mul:z:0gradient_tape/pow/Pow:z:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿn
gradient_tape/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"      
gradient_tape/Reshape_1Reshapegradient_tape/mul_1/Mul_1:z:0&gradient_tape/Reshape_1/shape:output:0*
T0*
_output_shapes

:L
gradient_tape/Shape_3Shapemul:z:0*
T0*
_output_shapes
:
gradient_tape/Tile_1Tile gradient_tape/Reshape_1:output:0gradient_tape/Shape_3:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ L
gradient_tape/Shape_4Shapemul:z:0*
T0*
_output_shapes
:X
gradient_tape/Shape_5Const*
_output_shapes
: *
dtype0*
valueB _
gradient_tape/Const_2Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_2Prodgradient_tape/Shape_4:output:0gradient_tape/Const_2:output:0*
T0*
_output_shapes
: _
gradient_tape/Const_3Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_3Prodgradient_tape/Shape_5:output:0gradient_tape/Const_3:output:0*
T0*
_output_shapes
: [
gradient_tape/Maximum_1/yConst*
_output_shapes
: *
dtype0*
value	B :
gradient_tape/Maximum_1Maximumgradient_tape/Prod_3:output:0"gradient_tape/Maximum_1/y:output:0*
T0*
_output_shapes
: 
gradient_tape/floordiv_1FloorDivgradient_tape/Prod_2:output:0gradient_tape/Maximum_1:z:0*
T0*
_output_shapes
: j
gradient_tape/Cast_1Castgradient_tape/floordiv_1:z:0*

DstT0*

SrcT0*
_output_shapes
: 
gradient_tape/truediv_1RealDivgradient_tape/Tile_1:output:0gradient_tape/Cast_1:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ Y
gradient_tape/sub/ShapeShapemodel_1/v/Tanh:y:0*
T0*
_output_shapes
:J
gradient_tape/sub/Shape_1Shapev*
T0*
_output_shapes
:º
'gradient_tape/sub/BroadcastGradientArgsBroadcastGradientArgs gradient_tape/sub/Shape:output:0"gradient_tape/sub/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
gradient_tape/sub/SumSumgradient_tape/pow/mul_1:z:0,gradient_tape/sub/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
gradient_tape/sub/ReshapeReshapegradient_tape/sub/Sum:output:0 gradient_tape/sub/Shape:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿN
gradient_tape/mul/ShapeShapeNeg:y:0*
T0*
_output_shapes
:P
gradient_tape/mul/Shape_1ShapeLog:y:0*
T0*
_output_shapes
:º
'gradient_tape/mul/BroadcastGradientArgsBroadcastGradientArgs gradient_tape/mul/Shape:output:0"gradient_tape/mul/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿu
gradient_tape/mul/MulMulNeg:y:0gradient_tape/truediv_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/mul/SumSumgradient_tape/mul/Mul:z:0,gradient_tape/mul/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
gradient_tape/mul/ReshapeReshapegradient_tape/mul/Sum:output:0"gradient_tape/mul/Shape_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
 gradient_tape/model_1/v/TanhGradTanhGradmodel_1/v/Tanh:y:0"gradient_tape/sub/Reshape:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
gradient_tape/Reciprocal
Reciprocalmodel_1/pi/Softmax:softmax:0^gradient_tape/mul/Reshape*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/mulMul"gradient_tape/mul/Reshape:output:0gradient_tape/Reciprocal:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
+gradient_tape/model_1/v/BiasAdd/BiasAddGradBiasAddGrad$gradient_tape/model_1/v/TanhGrad:z:0*
T0*
_output_shapes
:
gradient_tape/model_1/pi/mulMulgradient_tape/mul:z:0model_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ y
.gradient_tape/model_1/pi/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÁ
gradient_tape/model_1/pi/SumSum gradient_tape/model_1/pi/mul:z:07gradient_tape/model_1/pi/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
	keep_dims(
gradient_tape/model_1/pi/subSubgradient_tape/mul:z:0%gradient_tape/model_1/pi/Sum:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/model_1/pi/mul_1Mul gradient_tape/model_1/pi/sub:z:0model_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ Ä
%gradient_tape/model_1/v/MatMul/MatMulMatMul$gradient_tape/model_1/v/TanhGrad:z:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(¹
'gradient_tape/model_1/v/MatMul/MatMul_1MatMul#model_1/dropout_3/Identity:output:0$gradient_tape/model_1/v/TanhGrad:z:0*
T0*
_output_shapes
:	*
transpose_a(
,gradient_tape/model_1/pi/BiasAdd/BiasAddGradBiasAddGrad"gradient_tape/model_1/pi/mul_1:z:0*
T0*
_output_shapes	
: Ä
&gradient_tape/model_1/pi/MatMul/MatMulMatMul"gradient_tape/model_1/pi/mul_1:z:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(¹
(gradient_tape/model_1/pi/MatMul/MatMul_1MatMul#model_1/dropout_3/Identity:output:0"gradient_tape/model_1/pi/mul_1:z:0*
T0* 
_output_shapes
:
 *
transpose_a(«
AddNAddN/gradient_tape/model_1/v/MatMul/MatMul:product:00gradient_tape/model_1/pi/MatMul/MatMul:product:0*
N*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
+gradient_tape/model_1/activation_11/EluGradEluGrad
AddN:sum:0'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¤
Bgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/ShapeShape2model_1/batch_normalization_11/batchnorm/mul_1:z:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1Shape0model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿü
@gradient_tape/model_1/batch_normalization_11/batchnorm/add_1/SumSum7gradient_tape/model_1/activation_11/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
Bgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum_1Sum7gradient_tape/model_1/activation_11/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1:output:0*
T0*
_output_shapes	
:
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/ShapeShape model_1/dense_3/MatMul:product:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1Shape0model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿû
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/MulMulMgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape:output:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/SumSumDgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul:z:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿí
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul_1Mul model_1/dense_3/MatMul:product:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum_1SumFgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul_1:z:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1:output:0*
T0*
_output_shapes	
:¼
>gradient_tape/model_1/batch_normalization_11/batchnorm/sub/NegNegOgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:ù
+gradient_tape/model_1/dense_3/MatMul/MatMulMatMulMgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(é
-gradient_tape/model_1/dense_3/MatMul/MatMul_1MatMul#model_1/dropout_2/Identity:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape:output:0*
T0* 
_output_shapes
:
*
transpose_a(ã
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/MulMulBgradient_tape/model_1/batch_normalization_11/batchnorm/sub/Neg:y:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:ö
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/Mul_1MulBgradient_tape/model_1/batch_normalization_11/batchnorm/sub/Neg:y:0Amodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:0*
T0*
_output_shapes	
:Ö
AddN_1AddNOgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape_1:output:0Fgradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/Mul_1:z:0*
N*
T0*
_output_shapes	
:¾
>gradient_tape/model_1/batch_normalization_11/batchnorm/mul/MulMulAddN_1:sum:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¯
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1MulAddN_1:sum:02model_1/batch_normalization_11/batchnorm/Rsqrt:y:0*
T0*
_output_shapes	
:É
+gradient_tape/model_1/activation_10/EluGradEluGrad5gradient_tape/model_1/dense_3/MatMul/MatMul:product:0'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¤
Bgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/ShapeShape2model_1/batch_normalization_10/batchnorm/mul_1:z:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1Shape0model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿü
@gradient_tape/model_1/batch_normalization_10/batchnorm/add_1/SumSum7gradient_tape/model_1/activation_10/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
Bgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum_1Sum7gradient_tape/model_1/activation_10/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1:output:0*
T0*
_output_shapes	
:
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/ShapeShape model_1/dense_2/MatMul:product:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1Shape0model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿû
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/MulMulMgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape:output:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/SumSumDgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul:z:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿí
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul_1Mul model_1/dense_2/MatMul:product:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum_1SumFgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul_1:z:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1:output:0*
T0*
_output_shapes	
:¼
>gradient_tape/model_1/batch_normalization_10/batchnorm/sub/NegNegOgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:ù
+gradient_tape/model_1/dense_2/MatMul/MatMulMatMulMgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ*
transpose_b(è
-gradient_tape/model_1/dense_2/MatMul/MatMul_1MatMul"model_1/flatten_1/Reshape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape:output:0*
T0* 
_output_shapes
:
À*
transpose_a(ã
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/MulMulBgradient_tape/model_1/batch_normalization_10/batchnorm/sub/Neg:y:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:ö
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/Mul_1MulBgradient_tape/model_1/batch_normalization_10/batchnorm/sub/Neg:y:0Amodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:0*
T0*
_output_shapes	
:{
%gradient_tape/model_1/flatten_1/ShapeShape&model_1/activation_9/Elu:activations:0*
T0*
_output_shapes
:Ó
'gradient_tape/model_1/flatten_1/ReshapeReshape5gradient_tape/model_1/dense_2/MatMul/MatMul:product:0.gradient_tape/model_1/flatten_1/Shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿÖ
AddN_2AddNOgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape_1:output:0Fgradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/Mul_1:z:0*
N*
T0*
_output_shapes	
:¾
>gradient_tape/model_1/batch_normalization_10/batchnorm/mul/MulMulAddN_2:sum:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¯
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1MulAddN_2:sum:02model_1/batch_normalization_10/batchnorm/Rsqrt:y:0*
T0*
_output_shapes	
:É
*gradient_tape/model_1/activation_9/EluGradEluGrad0gradient_tape/model_1/flatten_1/Reshape:output:0&model_1/activation_9/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
zerosConst*
_output_shapes
:*
dtype0*
valueB*    T
zeros_1Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_2Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_3Const*
_output_shapes
:*
dtype0*
valueB*    |

zeros_like	ZerosLike@model_1/batch_normalization_9/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_9/EluGrad:backprops:0 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_9/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_7/Conv2D/ShapeNShapeN&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::é
9gradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_7/Conv2D/ShapeN:output:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
Ú
:gradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_8/Elu:activations:05gradient_tape/model_1/conv2d_7/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingVALID*
strides
Û
*gradient_tape/model_1/activation_8/EluGradEluGradBgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_8/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
zeros_4Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_5Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_6Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_7Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_1	ZerosLike@model_1/batch_normalization_8/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_8/EluGrad:backprops:0 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_8/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_6/Conv2D/ShapeNShapeN&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::é
9gradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_6/Conv2D/ShapeN:output:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
Ú
:gradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_7/Elu:activations:05gradient_tape/model_1/conv2d_6/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingVALID*
strides
Û
*gradient_tape/model_1/activation_7/EluGradEluGradBgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_7/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
zeros_8Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_9Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_10Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_11Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_2	ZerosLike@model_1/batch_normalization_7/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_7/EluGrad:backprops:0 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_7/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_5/Conv2D/ShapeNShapeN&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::è
9gradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_5/Conv2D/ShapeN:output:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
Ù
:gradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_6/Elu:activations:05gradient_tape/model_1/conv2d_5/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingSAME*
strides
Û
*gradient_tape/model_1/activation_6/EluGradEluGradBgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_6/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
zeros_12Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_13Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_14Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_15Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_3	ZerosLike@model_1/batch_normalization_6/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_6/EluGrad:backprops:0 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_6/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( 
,gradient_tape/model_1/conv2d_4/Conv2D/ShapeNShapeNx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::è
9gradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_4/Conv2D/ShapeN:output:0.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
´
:gradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilterConv2DBackpropFilterx5gradient_tape/model_1/conv2d_4/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingSAME*
strides
r
Adam/Cast/ReadVariableOpReadVariableOp!adam_cast_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/IdentityIdentity Adam/Cast/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: h
Adam/ReadVariableOpReadVariableOpadam_readvariableop_resource*
_output_shapes
: *
dtype0	z

Adam/add/yConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0	*
value	B	 R
Adam/addAddV2Adam/ReadVariableOp:value:0Adam/add/y:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0	*
_output_shapes
: 
Adam/Cast_1CastAdam/add:z:0",/job:localhost/replica:0/task:0/device:CPU:0*

DstT0*

SrcT0	*
_output_shapes
: v
Adam/Cast_2/ReadVariableOpReadVariableOp#adam_cast_2_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/Identity_1Identity"Adam/Cast_2/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: v
Adam/Cast_3/ReadVariableOpReadVariableOp#adam_cast_3_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/Identity_2Identity"Adam/Cast_3/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/PowPowAdam/Identity_1:output:0Adam/Cast_1:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 

Adam/Pow_1PowAdam/Identity_2:output:0Adam/Cast_1:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: }

Adam/sub/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?
Adam/subSubAdam/sub/x:output:0Adam/Pow_1:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: n
	Adam/SqrtSqrtAdam/sub:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/sub_1/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_1SubAdam/sub_1/x:output:0Adam/Pow:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/truedivRealDivAdam/Sqrt:y:0Adam/sub_1:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/mulMulAdam/Identity:output:0Adam/truediv:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: }

Adam/ConstConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *¿Ö3
Adam/sub_2/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_2SubAdam/sub_2/x:output:0Adam/Identity_1:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/sub_3/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_3SubAdam/sub_3/x:output:0Adam/Identity_2:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/Identity_3IdentityCgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_4IdentityQgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_5IdentityRgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_6IdentityCgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_7IdentityQgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_8IdentityRgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_9IdentityCgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_10IdentityQgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_11IdentityRgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_12IdentityCgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_13IdentityQgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_14IdentityRgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_15Identity7gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:
À
Adam/Identity_16IdentityDgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0*
T0*
_output_shapes	
:
Adam/Identity_17IdentityOgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:
Adam/Identity_18Identity7gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:

Adam/Identity_19IdentityDgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0*
T0*
_output_shapes	
:
Adam/Identity_20IdentityOgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:{
Adam/Identity_21Identity2gradient_tape/model_1/pi/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:
 y
Adam/Identity_22Identity5gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:0*
T0*
_output_shapes	
: y
Adam/Identity_23Identity1gradient_tape/model_1/v/MatMul/MatMul_1:product:0*
T0*
_output_shapes
:	w
Adam/Identity_24Identity4gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0*
T0*
_output_shapes
:ÿ
Adam/IdentityN	IdentityNCgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:07gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:07gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:02gradient_tape/model_1/pi/MatMul/MatMul_1:product:05gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:01gradient_tape/model_1/v/MatMul/MatMul_1:product:04gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0Cgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:07gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:07gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:02gradient_tape/model_1/pi/MatMul/MatMul_1:product:05gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:01gradient_tape/model_1/v/MatMul/MatMul_1:product:04gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0*5
T0
.2,**
_gradient_op_typeCustomGradient-3891*¶
_output_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	:
"Adam/Adam/update/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_4_conv2d_readvariableop_resource$adam_adam_update_resourceapplyadam_m$adam_adam_update_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:0'^model_1/conv2d_4/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_1/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_6_readvariableop_resource&adam_adam_update_1_resourceapplyadam_m&adam_adam_update_1_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:1-^model_1/batch_normalization_6/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_2/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_6_readvariableop_1_resource&adam_adam_update_2_resourceapplyadam_m&adam_adam_update_2_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:2/^model_1/batch_normalization_6/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_5_conv2d_readvariableop_resource&adam_adam_update_3_resourceapplyadam_m&adam_adam_update_3_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:3'^model_1/conv2d_5/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_4/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_7_readvariableop_resource&adam_adam_update_4_resourceapplyadam_m&adam_adam_update_4_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:4-^model_1/batch_normalization_7/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_5/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_7_readvariableop_1_resource&adam_adam_update_5_resourceapplyadam_m&adam_adam_update_5_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:5/^model_1/batch_normalization_7/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_6/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_6_conv2d_readvariableop_resource&adam_adam_update_6_resourceapplyadam_m&adam_adam_update_6_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:6'^model_1/conv2d_6/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_7/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_8_readvariableop_resource&adam_adam_update_7_resourceapplyadam_m&adam_adam_update_7_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:7-^model_1/batch_normalization_8/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_8/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_8_readvariableop_1_resource&adam_adam_update_8_resourceapplyadam_m&adam_adam_update_8_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:8/^model_1/batch_normalization_8/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_9/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_7_conv2d_readvariableop_resource&adam_adam_update_9_resourceapplyadam_m&adam_adam_update_9_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:9'^model_1/conv2d_7/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(µ
%Adam/Adam/update_10/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_9_readvariableop_resource'adam_adam_update_10_resourceapplyadam_m'adam_adam_update_10_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:10-^model_1/batch_normalization_9/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource*
_output_shapes
 *
use_locking(»
%Adam/Adam/update_11/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_9_readvariableop_1_resource'adam_adam_update_11_resourceapplyadam_m'adam_adam_update_11_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:11/^model_1/batch_normalization_9/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking( 
%Adam/Adam/update_12/ResourceApplyAdamResourceApplyAdam.model_1_dense_2_matmul_readvariableop_resource'adam_adam_update_12_resourceapplyadam_m'adam_adam_update_12_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:12&^model_1/dense_2/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(â
%Adam/Adam/update_13/ResourceApplyAdamResourceApplyAdamDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource'adam_adam_update_13_resourceapplyadam_m'adam_adam_update_13_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:13<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ü
%Adam/Adam/update_14/ResourceApplyAdamResourceApplyAdamBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource'adam_adam_update_14_resourceapplyadam_m'adam_adam_update_14_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:14:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2",/job:localhost/replica:0/task:0/device:CPU:0*
T0*U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource*
_output_shapes
 *
use_locking( 
%Adam/Adam/update_15/ResourceApplyAdamResourceApplyAdam.model_1_dense_3_matmul_readvariableop_resource'adam_adam_update_15_resourceapplyadam_m'adam_adam_update_15_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:15&^model_1/dense_3/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(â
%Adam/Adam/update_16/ResourceApplyAdamResourceApplyAdamDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource'adam_adam_update_16_resourceapplyadam_m'adam_adam_update_16_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:16<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ü
%Adam/Adam/update_17/ResourceApplyAdamResourceApplyAdamBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource'adam_adam_update_17_resourceapplyadam_m'adam_adam_update_17_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:17:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2",/job:localhost/replica:0/task:0/device:CPU:0*
T0*U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_18/ResourceApplyAdamResourceApplyAdam)model_1_pi_matmul_readvariableop_resource'adam_adam_update_18_resourceapplyadam_m'adam_adam_update_18_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:18!^model_1/pi/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_19/ResourceApplyAdamResourceApplyAdam*model_1_pi_biasadd_readvariableop_resource'adam_adam_update_19_resourceapplyadam_m'adam_adam_update_19_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:19"^model_1/pi/BiasAdd/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_20/ResourceApplyAdamResourceApplyAdam(model_1_v_matmul_readvariableop_resource'adam_adam_update_20_resourceapplyadam_m'adam_adam_update_20_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:20 ^model_1/v/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_21/ResourceApplyAdamResourceApplyAdam)model_1_v_biasadd_readvariableop_resource'adam_adam_update_21_resourceapplyadam_m'adam_adam_update_21_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:21!^model_1/v/BiasAdd/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ä
Adam/Adam/group_depsNoOp#^Adam/Adam/update/ResourceApplyAdam%^Adam/Adam/update_1/ResourceApplyAdam&^Adam/Adam/update_10/ResourceApplyAdam&^Adam/Adam/update_11/ResourceApplyAdam&^Adam/Adam/update_12/ResourceApplyAdam&^Adam/Adam/update_13/ResourceApplyAdam&^Adam/Adam/update_14/ResourceApplyAdam&^Adam/Adam/update_15/ResourceApplyAdam&^Adam/Adam/update_16/ResourceApplyAdam&^Adam/Adam/update_17/ResourceApplyAdam&^Adam/Adam/update_18/ResourceApplyAdam&^Adam/Adam/update_19/ResourceApplyAdam%^Adam/Adam/update_2/ResourceApplyAdam&^Adam/Adam/update_20/ResourceApplyAdam&^Adam/Adam/update_21/ResourceApplyAdam%^Adam/Adam/update_3/ResourceApplyAdam%^Adam/Adam/update_4/ResourceApplyAdam%^Adam/Adam/update_5/ResourceApplyAdam%^Adam/Adam/update_6/ResourceApplyAdam%^Adam/Adam/update_7/ResourceApplyAdam%^Adam/Adam/update_8/ResourceApplyAdam%^Adam/Adam/update_9/ResourceApplyAdam",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 h
Adam/Adam/ConstConst^Adam/Adam/group_deps*
_output_shapes
: *
dtype0	*
value	B	 R¥
Adam/Adam/AssignAddVariableOpAssignAddVariableOpadam_readvariableop_resourceAdam/Adam/Const:output:0^Adam/ReadVariableOp*
_output_shapes
 *
dtype0	K
IdentityIdentityMean:output:0^NoOp*
T0*
_output_shapes
: O

Identity_1IdentityMean_1:output:0^NoOp*
T0*
_output_shapes
: G

Identity_2Identityadd:z:0^NoOp*
T0*
_output_shapes
: 
NoOpNoOp^Adam/Adam/AssignAddVariableOp#^Adam/Adam/update/ResourceApplyAdam%^Adam/Adam/update_1/ResourceApplyAdam&^Adam/Adam/update_10/ResourceApplyAdam&^Adam/Adam/update_11/ResourceApplyAdam&^Adam/Adam/update_12/ResourceApplyAdam&^Adam/Adam/update_13/ResourceApplyAdam&^Adam/Adam/update_14/ResourceApplyAdam&^Adam/Adam/update_15/ResourceApplyAdam&^Adam/Adam/update_16/ResourceApplyAdam&^Adam/Adam/update_17/ResourceApplyAdam&^Adam/Adam/update_18/ResourceApplyAdam&^Adam/Adam/update_19/ResourceApplyAdam%^Adam/Adam/update_2/ResourceApplyAdam&^Adam/Adam/update_20/ResourceApplyAdam&^Adam/Adam/update_21/ResourceApplyAdam%^Adam/Adam/update_3/ResourceApplyAdam%^Adam/Adam/update_4/ResourceApplyAdam%^Adam/Adam/update_5/ResourceApplyAdam%^Adam/Adam/update_6/ResourceApplyAdam%^Adam/Adam/update_7/ResourceApplyAdam%^Adam/Adam/update_8/ResourceApplyAdam%^Adam/Adam/update_9/ResourceApplyAdam^Adam/Cast/ReadVariableOp^Adam/Cast_2/ReadVariableOp^Adam/Cast_3/ReadVariableOp^Adam/ReadVariableOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*ù
_input_shapesç
ä:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2>
Adam/Adam/AssignAddVariableOpAdam/Adam/AssignAddVariableOp2H
"Adam/Adam/update/ResourceApplyAdam"Adam/Adam/update/ResourceApplyAdam2L
$Adam/Adam/update_1/ResourceApplyAdam$Adam/Adam/update_1/ResourceApplyAdam2N
%Adam/Adam/update_10/ResourceApplyAdam%Adam/Adam/update_10/ResourceApplyAdam2N
%Adam/Adam/update_11/ResourceApplyAdam%Adam/Adam/update_11/ResourceApplyAdam2N
%Adam/Adam/update_12/ResourceApplyAdam%Adam/Adam/update_12/ResourceApplyAdam2N
%Adam/Adam/update_13/ResourceApplyAdam%Adam/Adam/update_13/ResourceApplyAdam2N
%Adam/Adam/update_14/ResourceApplyAdam%Adam/Adam/update_14/ResourceApplyAdam2N
%Adam/Adam/update_15/ResourceApplyAdam%Adam/Adam/update_15/ResourceApplyAdam2N
%Adam/Adam/update_16/ResourceApplyAdam%Adam/Adam/update_16/ResourceApplyAdam2N
%Adam/Adam/update_17/ResourceApplyAdam%Adam/Adam/update_17/ResourceApplyAdam2N
%Adam/Adam/update_18/ResourceApplyAdam%Adam/Adam/update_18/ResourceApplyAdam2N
%Adam/Adam/update_19/ResourceApplyAdam%Adam/Adam/update_19/ResourceApplyAdam2L
$Adam/Adam/update_2/ResourceApplyAdam$Adam/Adam/update_2/ResourceApplyAdam2N
%Adam/Adam/update_20/ResourceApplyAdam%Adam/Adam/update_20/ResourceApplyAdam2N
%Adam/Adam/update_21/ResourceApplyAdam%Adam/Adam/update_21/ResourceApplyAdam2L
$Adam/Adam/update_3/ResourceApplyAdam$Adam/Adam/update_3/ResourceApplyAdam2L
$Adam/Adam/update_4/ResourceApplyAdam$Adam/Adam/update_4/ResourceApplyAdam2L
$Adam/Adam/update_5/ResourceApplyAdam$Adam/Adam/update_5/ResourceApplyAdam2L
$Adam/Adam/update_6/ResourceApplyAdam$Adam/Adam/update_6/ResourceApplyAdam2L
$Adam/Adam/update_7/ResourceApplyAdam$Adam/Adam/update_7/ResourceApplyAdam2L
$Adam/Adam/update_8/ResourceApplyAdam$Adam/Adam/update_8/ResourceApplyAdam2L
$Adam/Adam/update_9/ResourceApplyAdam$Adam/Adam/update_9/ResourceApplyAdam24
Adam/Cast/ReadVariableOpAdam/Cast/ReadVariableOp28
Adam/Cast_2/ReadVariableOpAdam/Cast_2/ReadVariableOp28
Adam/Cast_3/ReadVariableOpAdam/Cast_3/ReadVariableOp2*
Adam/ReadVariableOpAdam/ReadVariableOp2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:LH
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:%

_output_shapes
: :H*D
B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource:H+D
B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource:N,J
H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource:N-J
H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource:P.L
J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource:P/L
J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource:H0D
B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource:H1D
B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource:N2J
H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource:N3J
H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource:P4L
J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource:P5L
J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource:H6D
B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource:H7D
B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource:N8J
H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource:N9J
H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource:P:L
J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource:P;L
J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource:H<D
B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource:H=D
B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource:N>J
H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource:N?J
H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource:P@L
J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource:PAL
J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource:GBC
A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource:GCC
A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource:]DY
W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource:]EY
W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource:[FW
U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource:[GW
U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource:GHC
A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource:GIC
A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource:]JY
W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource:]KY
W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource:[LW
U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource:[MW
U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource:BN>
<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource:BO>
<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource:CP?
=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource:CQ?
=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource:AR=
;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource:AS=
;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource:BT>
<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource:BU>
<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource
Ø
¾
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4427

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4332

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¡k
ê
A__inference_model_1_layer_call_and_return_conditional_losses_5475
input_2'
conv2d_4_5382:(
batch_normalization_6_5385:(
batch_normalization_6_5387:(
batch_normalization_6_5389:(
batch_normalization_6_5391:'
conv2d_5_5395:(
batch_normalization_7_5398:(
batch_normalization_7_5400:(
batch_normalization_7_5402:(
batch_normalization_7_5404:'
conv2d_6_5408:(
batch_normalization_8_5411:(
batch_normalization_8_5413:(
batch_normalization_8_5415:(
batch_normalization_8_5417:'
conv2d_7_5421:(
batch_normalization_9_5424:(
batch_normalization_9_5426:(
batch_normalization_9_5428:(
batch_normalization_9_5430: 
dense_2_5435:
À*
batch_normalization_10_5438:	*
batch_normalization_10_5440:	*
batch_normalization_10_5442:	*
batch_normalization_10_5444:	 
dense_3_5449:
*
batch_normalization_11_5452:	*
batch_normalization_11_5454:	*
batch_normalization_11_5456:	*
batch_normalization_11_5458:	
v_5463:	
v_5465:
pi_5468:
 
pi_5470:	 
identity

identity_1¢.batch_normalization_10/StatefulPartitionedCall¢.batch_normalization_11/StatefulPartitionedCall¢-batch_normalization_6/StatefulPartitionedCall¢-batch_normalization_7/StatefulPartitionedCall¢-batch_normalization_8/StatefulPartitionedCall¢-batch_normalization_9/StatefulPartitionedCall¢ conv2d_4/StatefulPartitionedCall¢ conv2d_5/StatefulPartitionedCall¢ conv2d_6/StatefulPartitionedCall¢ conv2d_7/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢pi/StatefulPartitionedCall¢v/StatefulPartitionedCallâ
 conv2d_4/StatefulPartitionedCallStatefulPartitionedCallinput_2conv2d_4_5382*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616
-batch_normalization_6/StatefulPartitionedCallStatefulPartitionedCall)conv2d_4/StatefulPartitionedCall:output:0batch_normalization_6_5385batch_normalization_6_5387batch_normalization_6_5389batch_normalization_6_5391*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4204ö
activation_6/PartitionedCallPartitionedCall6batch_normalization_6/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_6_layer_call_and_return_conditional_losses_4634
 conv2d_5/StatefulPartitionedCallStatefulPartitionedCall%activation_6/PartitionedCall:output:0conv2d_5_5395*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643
-batch_normalization_7/StatefulPartitionedCallStatefulPartitionedCall)conv2d_5/StatefulPartitionedCall:output:0batch_normalization_7_5398batch_normalization_7_5400batch_normalization_7_5402batch_normalization_7_5404*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4268ö
activation_7/PartitionedCallPartitionedCall6batch_normalization_7/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_7_layer_call_and_return_conditional_losses_4661
 conv2d_6/StatefulPartitionedCallStatefulPartitionedCall%activation_7/PartitionedCall:output:0conv2d_6_5408*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670
-batch_normalization_8/StatefulPartitionedCallStatefulPartitionedCall)conv2d_6/StatefulPartitionedCall:output:0batch_normalization_8_5411batch_normalization_8_5413batch_normalization_8_5415batch_normalization_8_5417*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4332ö
activation_8/PartitionedCallPartitionedCall6batch_normalization_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_8_layer_call_and_return_conditional_losses_4688
 conv2d_7/StatefulPartitionedCallStatefulPartitionedCall%activation_8/PartitionedCall:output:0conv2d_7_5421*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697
-batch_normalization_9/StatefulPartitionedCallStatefulPartitionedCall)conv2d_7/StatefulPartitionedCall:output:0batch_normalization_9_5424batch_normalization_9_5426batch_normalization_9_5428batch_normalization_9_5430*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4396ö
activation_9/PartitionedCallPartitionedCall6batch_normalization_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_9_layer_call_and_return_conditional_losses_4715Ø
flatten_1/PartitionedCallPartitionedCall%activation_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723ó
dense_2/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_2_5435*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_4732
.batch_normalization_10/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0batch_normalization_10_5438batch_normalization_10_5440batch_normalization_10_5442batch_normalization_10_5444*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4462ò
activation_10/PartitionedCallPartitionedCall7batch_normalization_10/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_10_layer_call_and_return_conditional_losses_4750Ù
dropout_2/PartitionedCallPartitionedCall&activation_10/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4757ó
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_3_5449*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_3_layer_call_and_return_conditional_losses_4766
.batch_normalization_11/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0batch_normalization_11_5452batch_normalization_11_5454batch_normalization_11_5456batch_normalization_11_5458*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4544ò
activation_11/PartitionedCallPartitionedCall7batch_normalization_11/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_11_layer_call_and_return_conditional_losses_4784Ù
dropout_3/PartitionedCallPartitionedCall&activation_11/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4791ê
v/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0v_5463v_5465*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *D
f?R=
;__inference_v_layer_call_and_return_conditional_losses_4804ï
pi/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0pi_5468pi_5470*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *E
f@R>
<__inference_pi_layer_call_and_return_conditional_losses_4821s
IdentityIdentity#pi/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s

Identity_1Identity"v/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿñ
NoOpNoOp/^batch_normalization_10/StatefulPartitionedCall/^batch_normalization_11/StatefulPartitionedCall.^batch_normalization_6/StatefulPartitionedCall.^batch_normalization_7/StatefulPartitionedCall.^batch_normalization_8/StatefulPartitionedCall.^batch_normalization_9/StatefulPartitionedCall!^conv2d_4/StatefulPartitionedCall!^conv2d_5/StatefulPartitionedCall!^conv2d_6/StatefulPartitionedCall!^conv2d_7/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall^pi/StatefulPartitionedCall^v/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_10/StatefulPartitionedCall.batch_normalization_10/StatefulPartitionedCall2`
.batch_normalization_11/StatefulPartitionedCall.batch_normalization_11/StatefulPartitionedCall2^
-batch_normalization_6/StatefulPartitionedCall-batch_normalization_6/StatefulPartitionedCall2^
-batch_normalization_7/StatefulPartitionedCall-batch_normalization_7/StatefulPartitionedCall2^
-batch_normalization_8/StatefulPartitionedCall-batch_normalization_8/StatefulPartitionedCall2^
-batch_normalization_9/StatefulPartitionedCall-batch_normalization_9/StatefulPartitionedCall2D
 conv2d_4/StatefulPartitionedCall conv2d_4/StatefulPartitionedCall2D
 conv2d_5/StatefulPartitionedCall conv2d_5/StatefulPartitionedCall2D
 conv2d_6/StatefulPartitionedCall conv2d_6/StatefulPartitionedCall2D
 conv2d_7/StatefulPartitionedCall conv2d_7/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall28
pi/StatefulPartitionedCallpi/StatefulPartitionedCall26
v/StatefulPartitionedCallv/StatefulPartitionedCall:X T
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
!
_user_specified_name	input_2
	
Ï
4__inference_batch_normalization_9_layer_call_fn_6331

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4427
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç
b
F__inference_activation_6_layer_call_and_return_conditional_losses_4634

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_8_layer_call_fn_6245

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4363
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
k
é
A__inference_model_1_layer_call_and_return_conditional_losses_4829

inputs'
conv2d_4_4617:(
batch_normalization_6_4620:(
batch_normalization_6_4622:(
batch_normalization_6_4624:(
batch_normalization_6_4626:'
conv2d_5_4644:(
batch_normalization_7_4647:(
batch_normalization_7_4649:(
batch_normalization_7_4651:(
batch_normalization_7_4653:'
conv2d_6_4671:(
batch_normalization_8_4674:(
batch_normalization_8_4676:(
batch_normalization_8_4678:(
batch_normalization_8_4680:'
conv2d_7_4698:(
batch_normalization_9_4701:(
batch_normalization_9_4703:(
batch_normalization_9_4705:(
batch_normalization_9_4707: 
dense_2_4733:
À*
batch_normalization_10_4736:	*
batch_normalization_10_4738:	*
batch_normalization_10_4740:	*
batch_normalization_10_4742:	 
dense_3_4767:
*
batch_normalization_11_4770:	*
batch_normalization_11_4772:	*
batch_normalization_11_4774:	*
batch_normalization_11_4776:	
v_4805:	
v_4807:
pi_4822:
 
pi_4824:	 
identity

identity_1¢.batch_normalization_10/StatefulPartitionedCall¢.batch_normalization_11/StatefulPartitionedCall¢-batch_normalization_6/StatefulPartitionedCall¢-batch_normalization_7/StatefulPartitionedCall¢-batch_normalization_8/StatefulPartitionedCall¢-batch_normalization_9/StatefulPartitionedCall¢ conv2d_4/StatefulPartitionedCall¢ conv2d_5/StatefulPartitionedCall¢ conv2d_6/StatefulPartitionedCall¢ conv2d_7/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢pi/StatefulPartitionedCall¢v/StatefulPartitionedCallá
 conv2d_4/StatefulPartitionedCallStatefulPartitionedCallinputsconv2d_4_4617*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616
-batch_normalization_6/StatefulPartitionedCallStatefulPartitionedCall)conv2d_4/StatefulPartitionedCall:output:0batch_normalization_6_4620batch_normalization_6_4622batch_normalization_6_4624batch_normalization_6_4626*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4204ö
activation_6/PartitionedCallPartitionedCall6batch_normalization_6/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_6_layer_call_and_return_conditional_losses_4634
 conv2d_5/StatefulPartitionedCallStatefulPartitionedCall%activation_6/PartitionedCall:output:0conv2d_5_4644*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643
-batch_normalization_7/StatefulPartitionedCallStatefulPartitionedCall)conv2d_5/StatefulPartitionedCall:output:0batch_normalization_7_4647batch_normalization_7_4649batch_normalization_7_4651batch_normalization_7_4653*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4268ö
activation_7/PartitionedCallPartitionedCall6batch_normalization_7/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_7_layer_call_and_return_conditional_losses_4661
 conv2d_6/StatefulPartitionedCallStatefulPartitionedCall%activation_7/PartitionedCall:output:0conv2d_6_4671*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670
-batch_normalization_8/StatefulPartitionedCallStatefulPartitionedCall)conv2d_6/StatefulPartitionedCall:output:0batch_normalization_8_4674batch_normalization_8_4676batch_normalization_8_4678batch_normalization_8_4680*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4332ö
activation_8/PartitionedCallPartitionedCall6batch_normalization_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_8_layer_call_and_return_conditional_losses_4688
 conv2d_7/StatefulPartitionedCallStatefulPartitionedCall%activation_8/PartitionedCall:output:0conv2d_7_4698*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697
-batch_normalization_9/StatefulPartitionedCallStatefulPartitionedCall)conv2d_7/StatefulPartitionedCall:output:0batch_normalization_9_4701batch_normalization_9_4703batch_normalization_9_4705batch_normalization_9_4707*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4396ö
activation_9/PartitionedCallPartitionedCall6batch_normalization_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_9_layer_call_and_return_conditional_losses_4715Ø
flatten_1/PartitionedCallPartitionedCall%activation_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723ó
dense_2/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_2_4733*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_4732
.batch_normalization_10/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0batch_normalization_10_4736batch_normalization_10_4738batch_normalization_10_4740batch_normalization_10_4742*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4462ò
activation_10/PartitionedCallPartitionedCall7batch_normalization_10/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_10_layer_call_and_return_conditional_losses_4750Ù
dropout_2/PartitionedCallPartitionedCall&activation_10/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4757ó
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_3_4767*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_3_layer_call_and_return_conditional_losses_4766
.batch_normalization_11/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0batch_normalization_11_4770batch_normalization_11_4772batch_normalization_11_4774batch_normalization_11_4776*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4544ò
activation_11/PartitionedCallPartitionedCall7batch_normalization_11/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_11_layer_call_and_return_conditional_losses_4784Ù
dropout_3/PartitionedCallPartitionedCall&activation_11/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4791ê
v/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0v_4805v_4807*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *D
f?R=
;__inference_v_layer_call_and_return_conditional_losses_4804ï
pi/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0pi_4822pi_4824*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *E
f@R>
<__inference_pi_layer_call_and_return_conditional_losses_4821s
IdentityIdentity#pi/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s

Identity_1Identity"v/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿñ
NoOpNoOp/^batch_normalization_10/StatefulPartitionedCall/^batch_normalization_11/StatefulPartitionedCall.^batch_normalization_6/StatefulPartitionedCall.^batch_normalization_7/StatefulPartitionedCall.^batch_normalization_8/StatefulPartitionedCall.^batch_normalization_9/StatefulPartitionedCall!^conv2d_4/StatefulPartitionedCall!^conv2d_5/StatefulPartitionedCall!^conv2d_6/StatefulPartitionedCall!^conv2d_7/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall^pi/StatefulPartitionedCall^v/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_10/StatefulPartitionedCall.batch_normalization_10/StatefulPartitionedCall2`
.batch_normalization_11/StatefulPartitionedCall.batch_normalization_11/StatefulPartitionedCall2^
-batch_normalization_6/StatefulPartitionedCall-batch_normalization_6/StatefulPartitionedCall2^
-batch_normalization_7/StatefulPartitionedCall-batch_normalization_7/StatefulPartitionedCall2^
-batch_normalization_8/StatefulPartitionedCall-batch_normalization_8/StatefulPartitionedCall2^
-batch_normalization_9/StatefulPartitionedCall-batch_normalization_9/StatefulPartitionedCall2D
 conv2d_4/StatefulPartitionedCall conv2d_4/StatefulPartitionedCall2D
 conv2d_5/StatefulPartitionedCall conv2d_5/StatefulPartitionedCall2D
 conv2d_6/StatefulPartitionedCall conv2d_6/StatefulPartitionedCall2D
 conv2d_7/StatefulPartitionedCall conv2d_7/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall28
pi/StatefulPartitionedCallpi/StatefulPartitionedCall26
v/StatefulPartitionedCallv/StatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
°
'
__inference__traced_save_7255
file_prefix(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop+
'savev2_save_counter_read_readvariableop	.
*savev2_conv2d_4_kernel_read_readvariableop:
6savev2_batch_normalization_6_gamma_read_readvariableop9
5savev2_batch_normalization_6_beta_read_readvariableop@
<savev2_batch_normalization_6_moving_mean_read_readvariableopD
@savev2_batch_normalization_6_moving_variance_read_readvariableop.
*savev2_conv2d_5_kernel_read_readvariableop:
6savev2_batch_normalization_7_gamma_read_readvariableop9
5savev2_batch_normalization_7_beta_read_readvariableop@
<savev2_batch_normalization_7_moving_mean_read_readvariableopD
@savev2_batch_normalization_7_moving_variance_read_readvariableop.
*savev2_conv2d_6_kernel_read_readvariableop:
6savev2_batch_normalization_8_gamma_read_readvariableop9
5savev2_batch_normalization_8_beta_read_readvariableop@
<savev2_batch_normalization_8_moving_mean_read_readvariableopD
@savev2_batch_normalization_8_moving_variance_read_readvariableop.
*savev2_conv2d_7_kernel_read_readvariableop:
6savev2_batch_normalization_9_gamma_read_readvariableop9
5savev2_batch_normalization_9_beta_read_readvariableop@
<savev2_batch_normalization_9_moving_mean_read_readvariableopD
@savev2_batch_normalization_9_moving_variance_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop;
7savev2_batch_normalization_10_gamma_read_readvariableop:
6savev2_batch_normalization_10_beta_read_readvariableopA
=savev2_batch_normalization_10_moving_mean_read_readvariableopE
Asavev2_batch_normalization_10_moving_variance_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop;
7savev2_batch_normalization_11_gamma_read_readvariableop:
6savev2_batch_normalization_11_beta_read_readvariableopA
=savev2_batch_normalization_11_moving_mean_read_readvariableopE
Asavev2_batch_normalization_11_moving_variance_read_readvariableop(
$savev2_pi_kernel_read_readvariableop&
"savev2_pi_bias_read_readvariableop'
#savev2_v_kernel_read_readvariableop%
!savev2_v_bias_read_readvariableop5
1savev2_adam_conv2d_4_kernel_m_read_readvariableopA
=savev2_adam_batch_normalization_6_gamma_m_read_readvariableop@
<savev2_adam_batch_normalization_6_beta_m_read_readvariableop5
1savev2_adam_conv2d_5_kernel_m_read_readvariableopA
=savev2_adam_batch_normalization_7_gamma_m_read_readvariableop@
<savev2_adam_batch_normalization_7_beta_m_read_readvariableop5
1savev2_adam_conv2d_6_kernel_m_read_readvariableopA
=savev2_adam_batch_normalization_8_gamma_m_read_readvariableop@
<savev2_adam_batch_normalization_8_beta_m_read_readvariableop5
1savev2_adam_conv2d_7_kernel_m_read_readvariableopA
=savev2_adam_batch_normalization_9_gamma_m_read_readvariableop@
<savev2_adam_batch_normalization_9_beta_m_read_readvariableop4
0savev2_adam_dense_2_kernel_m_read_readvariableopB
>savev2_adam_batch_normalization_10_gamma_m_read_readvariableopA
=savev2_adam_batch_normalization_10_beta_m_read_readvariableop4
0savev2_adam_dense_3_kernel_m_read_readvariableopB
>savev2_adam_batch_normalization_11_gamma_m_read_readvariableopA
=savev2_adam_batch_normalization_11_beta_m_read_readvariableop/
+savev2_adam_pi_kernel_m_read_readvariableop-
)savev2_adam_pi_bias_m_read_readvariableop.
*savev2_adam_v_kernel_m_read_readvariableop,
(savev2_adam_v_bias_m_read_readvariableop5
1savev2_adam_conv2d_4_kernel_v_read_readvariableopA
=savev2_adam_batch_normalization_6_gamma_v_read_readvariableop@
<savev2_adam_batch_normalization_6_beta_v_read_readvariableop5
1savev2_adam_conv2d_5_kernel_v_read_readvariableopA
=savev2_adam_batch_normalization_7_gamma_v_read_readvariableop@
<savev2_adam_batch_normalization_7_beta_v_read_readvariableop5
1savev2_adam_conv2d_6_kernel_v_read_readvariableopA
=savev2_adam_batch_normalization_8_gamma_v_read_readvariableop@
<savev2_adam_batch_normalization_8_beta_v_read_readvariableop5
1savev2_adam_conv2d_7_kernel_v_read_readvariableopA
=savev2_adam_batch_normalization_9_gamma_v_read_readvariableop@
<savev2_adam_batch_normalization_9_beta_v_read_readvariableop4
0savev2_adam_dense_2_kernel_v_read_readvariableopB
>savev2_adam_batch_normalization_10_gamma_v_read_readvariableopA
=savev2_adam_batch_normalization_10_beta_v_read_readvariableop4
0savev2_adam_dense_3_kernel_v_read_readvariableopB
>savev2_adam_batch_normalization_11_gamma_v_read_readvariableopA
=savev2_adam_batch_normalization_11_beta_v_read_readvariableop/
+savev2_adam_pi_kernel_v_read_readvariableop-
)savev2_adam_pi_bias_v_read_readvariableop.
*savev2_adam_v_kernel_v_read_readvariableop,
(savev2_adam_v_bias_v_read_readvariableop
savev2_const_1

identity_1¢MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: Ô6
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:U*
dtype0*ý5
valueó5Bð5UB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB2checkpoint/save_counter/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEBHmodel/model/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBLmodel/model/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:U*
dtype0*¿
valueµB²UB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Õ%
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop'savev2_save_counter_read_readvariableop*savev2_conv2d_4_kernel_read_readvariableop6savev2_batch_normalization_6_gamma_read_readvariableop5savev2_batch_normalization_6_beta_read_readvariableop<savev2_batch_normalization_6_moving_mean_read_readvariableop@savev2_batch_normalization_6_moving_variance_read_readvariableop*savev2_conv2d_5_kernel_read_readvariableop6savev2_batch_normalization_7_gamma_read_readvariableop5savev2_batch_normalization_7_beta_read_readvariableop<savev2_batch_normalization_7_moving_mean_read_readvariableop@savev2_batch_normalization_7_moving_variance_read_readvariableop*savev2_conv2d_6_kernel_read_readvariableop6savev2_batch_normalization_8_gamma_read_readvariableop5savev2_batch_normalization_8_beta_read_readvariableop<savev2_batch_normalization_8_moving_mean_read_readvariableop@savev2_batch_normalization_8_moving_variance_read_readvariableop*savev2_conv2d_7_kernel_read_readvariableop6savev2_batch_normalization_9_gamma_read_readvariableop5savev2_batch_normalization_9_beta_read_readvariableop<savev2_batch_normalization_9_moving_mean_read_readvariableop@savev2_batch_normalization_9_moving_variance_read_readvariableop)savev2_dense_2_kernel_read_readvariableop7savev2_batch_normalization_10_gamma_read_readvariableop6savev2_batch_normalization_10_beta_read_readvariableop=savev2_batch_normalization_10_moving_mean_read_readvariableopAsavev2_batch_normalization_10_moving_variance_read_readvariableop)savev2_dense_3_kernel_read_readvariableop7savev2_batch_normalization_11_gamma_read_readvariableop6savev2_batch_normalization_11_beta_read_readvariableop=savev2_batch_normalization_11_moving_mean_read_readvariableopAsavev2_batch_normalization_11_moving_variance_read_readvariableop$savev2_pi_kernel_read_readvariableop"savev2_pi_bias_read_readvariableop#savev2_v_kernel_read_readvariableop!savev2_v_bias_read_readvariableop1savev2_adam_conv2d_4_kernel_m_read_readvariableop=savev2_adam_batch_normalization_6_gamma_m_read_readvariableop<savev2_adam_batch_normalization_6_beta_m_read_readvariableop1savev2_adam_conv2d_5_kernel_m_read_readvariableop=savev2_adam_batch_normalization_7_gamma_m_read_readvariableop<savev2_adam_batch_normalization_7_beta_m_read_readvariableop1savev2_adam_conv2d_6_kernel_m_read_readvariableop=savev2_adam_batch_normalization_8_gamma_m_read_readvariableop<savev2_adam_batch_normalization_8_beta_m_read_readvariableop1savev2_adam_conv2d_7_kernel_m_read_readvariableop=savev2_adam_batch_normalization_9_gamma_m_read_readvariableop<savev2_adam_batch_normalization_9_beta_m_read_readvariableop0savev2_adam_dense_2_kernel_m_read_readvariableop>savev2_adam_batch_normalization_10_gamma_m_read_readvariableop=savev2_adam_batch_normalization_10_beta_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop>savev2_adam_batch_normalization_11_gamma_m_read_readvariableop=savev2_adam_batch_normalization_11_beta_m_read_readvariableop+savev2_adam_pi_kernel_m_read_readvariableop)savev2_adam_pi_bias_m_read_readvariableop*savev2_adam_v_kernel_m_read_readvariableop(savev2_adam_v_bias_m_read_readvariableop1savev2_adam_conv2d_4_kernel_v_read_readvariableop=savev2_adam_batch_normalization_6_gamma_v_read_readvariableop<savev2_adam_batch_normalization_6_beta_v_read_readvariableop1savev2_adam_conv2d_5_kernel_v_read_readvariableop=savev2_adam_batch_normalization_7_gamma_v_read_readvariableop<savev2_adam_batch_normalization_7_beta_v_read_readvariableop1savev2_adam_conv2d_6_kernel_v_read_readvariableop=savev2_adam_batch_normalization_8_gamma_v_read_readvariableop<savev2_adam_batch_normalization_8_beta_v_read_readvariableop1savev2_adam_conv2d_7_kernel_v_read_readvariableop=savev2_adam_batch_normalization_9_gamma_v_read_readvariableop<savev2_adam_batch_normalization_9_beta_v_read_readvariableop0savev2_adam_dense_2_kernel_v_read_readvariableop>savev2_adam_batch_normalization_10_gamma_v_read_readvariableop=savev2_adam_batch_normalization_10_beta_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop>savev2_adam_batch_normalization_11_gamma_v_read_readvariableop=savev2_adam_batch_normalization_11_beta_v_read_readvariableop+savev2_adam_pi_kernel_v_read_readvariableop)savev2_adam_pi_bias_v_read_readvariableop*savev2_adam_v_kernel_v_read_readvariableop(savev2_adam_v_bias_v_read_readvariableopsavev2_const_1"/device:CPU:0*
_output_shapes
 *c
dtypesY
W2U		
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*á
_input_shapesÏ
Ì: : : : : : : :::::::::::::::::::::
À:::::
:::::
 : :	::::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
:: 

_output_shapes
:: 	

_output_shapes
:: 


_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::&"
 
_output_shapes
:
À:!

_output_shapes	
::!

_output_shapes	
::!

_output_shapes	
::!

_output_shapes	
::& "
 
_output_shapes
:
:!!

_output_shapes	
::!"

_output_shapes	
::!#

_output_shapes	
::!$

_output_shapes	
::&%"
 
_output_shapes
:
 :!&

_output_shapes	
: :%'!

_output_shapes
:	: (

_output_shapes
::,)(
&
_output_shapes
:: *

_output_shapes
:: +

_output_shapes
::,,(
&
_output_shapes
:: -

_output_shapes
:: .

_output_shapes
::,/(
&
_output_shapes
:: 0

_output_shapes
:: 1

_output_shapes
::,2(
&
_output_shapes
:: 3

_output_shapes
:: 4

_output_shapes
::&5"
 
_output_shapes
:
À:!6

_output_shapes	
::!7

_output_shapes	
::&8"
 
_output_shapes
:
:!9

_output_shapes	
::!:

_output_shapes	
::&;"
 
_output_shapes
:
 :!<

_output_shapes	
: :%=!

_output_shapes
:	: >

_output_shapes
::,?(
&
_output_shapes
:: @

_output_shapes
:: A

_output_shapes
::,B(
&
_output_shapes
:: C

_output_shapes
:: D

_output_shapes
::,E(
&
_output_shapes
:: F

_output_shapes
:: G

_output_shapes
::,H(
&
_output_shapes
:: I

_output_shapes
:: J

_output_shapes
::&K"
 
_output_shapes
:
À:!L

_output_shapes	
::!M

_output_shapes	
::&N"
 
_output_shapes
:
:!O

_output_shapes	
::!P

_output_shapes	
::&Q"
 
_output_shapes
:
 :!R

_output_shapes	
: :%S!

_output_shapes
:	: T

_output_shapes
::U

_output_shapes
: 
ç
b
F__inference_activation_7_layer_call_and_return_conditional_losses_6205

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
²Ý
Ò8
 __inference__traced_restore_7517
file_prefix$
assignvariableop_adam_iter:	 (
assignvariableop_1_adam_beta_1: (
assignvariableop_2_adam_beta_2: '
assignvariableop_3_adam_decay: /
%assignvariableop_4_adam_learning_rate: )
assignvariableop_5_save_counter:	 <
"assignvariableop_6_conv2d_4_kernel:<
.assignvariableop_7_batch_normalization_6_gamma:;
-assignvariableop_8_batch_normalization_6_beta:B
4assignvariableop_9_batch_normalization_6_moving_mean:G
9assignvariableop_10_batch_normalization_6_moving_variance:=
#assignvariableop_11_conv2d_5_kernel:=
/assignvariableop_12_batch_normalization_7_gamma:<
.assignvariableop_13_batch_normalization_7_beta:C
5assignvariableop_14_batch_normalization_7_moving_mean:G
9assignvariableop_15_batch_normalization_7_moving_variance:=
#assignvariableop_16_conv2d_6_kernel:=
/assignvariableop_17_batch_normalization_8_gamma:<
.assignvariableop_18_batch_normalization_8_beta:C
5assignvariableop_19_batch_normalization_8_moving_mean:G
9assignvariableop_20_batch_normalization_8_moving_variance:=
#assignvariableop_21_conv2d_7_kernel:=
/assignvariableop_22_batch_normalization_9_gamma:<
.assignvariableop_23_batch_normalization_9_beta:C
5assignvariableop_24_batch_normalization_9_moving_mean:G
9assignvariableop_25_batch_normalization_9_moving_variance:6
"assignvariableop_26_dense_2_kernel:
À?
0assignvariableop_27_batch_normalization_10_gamma:	>
/assignvariableop_28_batch_normalization_10_beta:	E
6assignvariableop_29_batch_normalization_10_moving_mean:	I
:assignvariableop_30_batch_normalization_10_moving_variance:	6
"assignvariableop_31_dense_3_kernel:
?
0assignvariableop_32_batch_normalization_11_gamma:	>
/assignvariableop_33_batch_normalization_11_beta:	E
6assignvariableop_34_batch_normalization_11_moving_mean:	I
:assignvariableop_35_batch_normalization_11_moving_variance:	1
assignvariableop_36_pi_kernel:
 *
assignvariableop_37_pi_bias:	 /
assignvariableop_38_v_kernel:	(
assignvariableop_39_v_bias:D
*assignvariableop_40_adam_conv2d_4_kernel_m:D
6assignvariableop_41_adam_batch_normalization_6_gamma_m:C
5assignvariableop_42_adam_batch_normalization_6_beta_m:D
*assignvariableop_43_adam_conv2d_5_kernel_m:D
6assignvariableop_44_adam_batch_normalization_7_gamma_m:C
5assignvariableop_45_adam_batch_normalization_7_beta_m:D
*assignvariableop_46_adam_conv2d_6_kernel_m:D
6assignvariableop_47_adam_batch_normalization_8_gamma_m:C
5assignvariableop_48_adam_batch_normalization_8_beta_m:D
*assignvariableop_49_adam_conv2d_7_kernel_m:D
6assignvariableop_50_adam_batch_normalization_9_gamma_m:C
5assignvariableop_51_adam_batch_normalization_9_beta_m:=
)assignvariableop_52_adam_dense_2_kernel_m:
ÀF
7assignvariableop_53_adam_batch_normalization_10_gamma_m:	E
6assignvariableop_54_adam_batch_normalization_10_beta_m:	=
)assignvariableop_55_adam_dense_3_kernel_m:
F
7assignvariableop_56_adam_batch_normalization_11_gamma_m:	E
6assignvariableop_57_adam_batch_normalization_11_beta_m:	8
$assignvariableop_58_adam_pi_kernel_m:
 1
"assignvariableop_59_adam_pi_bias_m:	 6
#assignvariableop_60_adam_v_kernel_m:	/
!assignvariableop_61_adam_v_bias_m:D
*assignvariableop_62_adam_conv2d_4_kernel_v:D
6assignvariableop_63_adam_batch_normalization_6_gamma_v:C
5assignvariableop_64_adam_batch_normalization_6_beta_v:D
*assignvariableop_65_adam_conv2d_5_kernel_v:D
6assignvariableop_66_adam_batch_normalization_7_gamma_v:C
5assignvariableop_67_adam_batch_normalization_7_beta_v:D
*assignvariableop_68_adam_conv2d_6_kernel_v:D
6assignvariableop_69_adam_batch_normalization_8_gamma_v:C
5assignvariableop_70_adam_batch_normalization_8_beta_v:D
*assignvariableop_71_adam_conv2d_7_kernel_v:D
6assignvariableop_72_adam_batch_normalization_9_gamma_v:C
5assignvariableop_73_adam_batch_normalization_9_beta_v:=
)assignvariableop_74_adam_dense_2_kernel_v:
ÀF
7assignvariableop_75_adam_batch_normalization_10_gamma_v:	E
6assignvariableop_76_adam_batch_normalization_10_beta_v:	=
)assignvariableop_77_adam_dense_3_kernel_v:
F
7assignvariableop_78_adam_batch_normalization_11_gamma_v:	E
6assignvariableop_79_adam_batch_normalization_11_beta_v:	8
$assignvariableop_80_adam_pi_kernel_v:
 1
"assignvariableop_81_adam_pi_bias_v:	 6
#assignvariableop_82_adam_v_kernel_v:	/
!assignvariableop_83_adam_v_bias_v:
identity_85¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_31¢AssignVariableOp_32¢AssignVariableOp_33¢AssignVariableOp_34¢AssignVariableOp_35¢AssignVariableOp_36¢AssignVariableOp_37¢AssignVariableOp_38¢AssignVariableOp_39¢AssignVariableOp_4¢AssignVariableOp_40¢AssignVariableOp_41¢AssignVariableOp_42¢AssignVariableOp_43¢AssignVariableOp_44¢AssignVariableOp_45¢AssignVariableOp_46¢AssignVariableOp_47¢AssignVariableOp_48¢AssignVariableOp_49¢AssignVariableOp_5¢AssignVariableOp_50¢AssignVariableOp_51¢AssignVariableOp_52¢AssignVariableOp_53¢AssignVariableOp_54¢AssignVariableOp_55¢AssignVariableOp_56¢AssignVariableOp_57¢AssignVariableOp_58¢AssignVariableOp_59¢AssignVariableOp_6¢AssignVariableOp_60¢AssignVariableOp_61¢AssignVariableOp_62¢AssignVariableOp_63¢AssignVariableOp_64¢AssignVariableOp_65¢AssignVariableOp_66¢AssignVariableOp_67¢AssignVariableOp_68¢AssignVariableOp_69¢AssignVariableOp_7¢AssignVariableOp_70¢AssignVariableOp_71¢AssignVariableOp_72¢AssignVariableOp_73¢AssignVariableOp_74¢AssignVariableOp_75¢AssignVariableOp_76¢AssignVariableOp_77¢AssignVariableOp_78¢AssignVariableOp_79¢AssignVariableOp_8¢AssignVariableOp_80¢AssignVariableOp_81¢AssignVariableOp_82¢AssignVariableOp_83¢AssignVariableOp_9×6
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:U*
dtype0*ý5
valueó5Bð5UB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB2checkpoint/save_counter/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB@model/model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEBGmodel/model/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBKmodel/model/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEBBmodel/model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEBHmodel/model/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBLmodel/model/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEBCmodel/model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEBAmodel/model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-1/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-7/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\model/model/layer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB^model/model/layer_with_weights-11/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-12/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_model/model/layer_with_weights-13/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]model/model/layer_with_weights-13/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:U*
dtype0*¿
valueµB²UB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Ê
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*ê
_output_shapes×
Ô:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*c
dtypesY
W2U		[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOpAssignVariableOpassignvariableop_adam_iterIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOpassignvariableop_1_adam_beta_1Identity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOpassignvariableop_2_adam_beta_2Identity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_decayIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp%assignvariableop_4_adam_learning_rateIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_5AssignVariableOpassignvariableop_5_save_counterIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_6AssignVariableOp"assignvariableop_6_conv2d_4_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_7AssignVariableOp.assignvariableop_7_batch_normalization_6_gammaIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_8AssignVariableOp-assignvariableop_8_batch_normalization_6_betaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:£
AssignVariableOp_9AssignVariableOp4assignvariableop_9_batch_normalization_6_moving_meanIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:ª
AssignVariableOp_10AssignVariableOp9assignvariableop_10_batch_normalization_6_moving_varianceIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_11AssignVariableOp#assignvariableop_11_conv2d_5_kernelIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_12AssignVariableOp/assignvariableop_12_batch_normalization_7_gammaIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_13AssignVariableOp.assignvariableop_13_batch_normalization_7_betaIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_14AssignVariableOp5assignvariableop_14_batch_normalization_7_moving_meanIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:ª
AssignVariableOp_15AssignVariableOp9assignvariableop_15_batch_normalization_7_moving_varianceIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_16AssignVariableOp#assignvariableop_16_conv2d_6_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_17AssignVariableOp/assignvariableop_17_batch_normalization_8_gammaIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_18AssignVariableOp.assignvariableop_18_batch_normalization_8_betaIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_19AssignVariableOp5assignvariableop_19_batch_normalization_8_moving_meanIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:ª
AssignVariableOp_20AssignVariableOp9assignvariableop_20_batch_normalization_8_moving_varianceIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_21AssignVariableOp#assignvariableop_21_conv2d_7_kernelIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_22AssignVariableOp/assignvariableop_22_batch_normalization_9_gammaIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_23AssignVariableOp.assignvariableop_23_batch_normalization_9_betaIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_24AssignVariableOp5assignvariableop_24_batch_normalization_9_moving_meanIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:ª
AssignVariableOp_25AssignVariableOp9assignvariableop_25_batch_normalization_9_moving_varianceIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_26AssignVariableOp"assignvariableop_26_dense_2_kernelIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:¡
AssignVariableOp_27AssignVariableOp0assignvariableop_27_batch_normalization_10_gammaIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_28AssignVariableOp/assignvariableop_28_batch_normalization_10_betaIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_29AssignVariableOp6assignvariableop_29_batch_normalization_10_moving_meanIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:«
AssignVariableOp_30AssignVariableOp:assignvariableop_30_batch_normalization_10_moving_varianceIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_31AssignVariableOp"assignvariableop_31_dense_3_kernelIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:¡
AssignVariableOp_32AssignVariableOp0assignvariableop_32_batch_normalization_11_gammaIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_33AssignVariableOp/assignvariableop_33_batch_normalization_11_betaIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_34AssignVariableOp6assignvariableop_34_batch_normalization_11_moving_meanIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:«
AssignVariableOp_35AssignVariableOp:assignvariableop_35_batch_normalization_11_moving_varianceIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_36AssignVariableOpassignvariableop_36_pi_kernelIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_37AssignVariableOpassignvariableop_37_pi_biasIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_38AssignVariableOpassignvariableop_38_v_kernelIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_39AssignVariableOpassignvariableop_39_v_biasIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_40AssignVariableOp*assignvariableop_40_adam_conv2d_4_kernel_mIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_41AssignVariableOp6assignvariableop_41_adam_batch_normalization_6_gamma_mIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_42AssignVariableOp5assignvariableop_42_adam_batch_normalization_6_beta_mIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_43AssignVariableOp*assignvariableop_43_adam_conv2d_5_kernel_mIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_44AssignVariableOp6assignvariableop_44_adam_batch_normalization_7_gamma_mIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_45AssignVariableOp5assignvariableop_45_adam_batch_normalization_7_beta_mIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_46AssignVariableOp*assignvariableop_46_adam_conv2d_6_kernel_mIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_47AssignVariableOp6assignvariableop_47_adam_batch_normalization_8_gamma_mIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_48AssignVariableOp5assignvariableop_48_adam_batch_normalization_8_beta_mIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_49AssignVariableOp*assignvariableop_49_adam_conv2d_7_kernel_mIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_50AssignVariableOp6assignvariableop_50_adam_batch_normalization_9_gamma_mIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_51AssignVariableOp5assignvariableop_51_adam_batch_normalization_9_beta_mIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_52AssignVariableOp)assignvariableop_52_adam_dense_2_kernel_mIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_53AssignVariableOp7assignvariableop_53_adam_batch_normalization_10_gamma_mIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_54AssignVariableOp6assignvariableop_54_adam_batch_normalization_10_beta_mIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_55AssignVariableOp)assignvariableop_55_adam_dense_3_kernel_mIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_56AssignVariableOp7assignvariableop_56_adam_batch_normalization_11_gamma_mIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_57AssignVariableOp6assignvariableop_57_adam_batch_normalization_11_beta_mIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_58AssignVariableOp$assignvariableop_58_adam_pi_kernel_mIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_59AssignVariableOp"assignvariableop_59_adam_pi_bias_mIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_60AssignVariableOp#assignvariableop_60_adam_v_kernel_mIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_61AssignVariableOp!assignvariableop_61_adam_v_bias_mIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_62AssignVariableOp*assignvariableop_62_adam_conv2d_4_kernel_vIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_63AssignVariableOp6assignvariableop_63_adam_batch_normalization_6_gamma_vIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_64AssignVariableOp5assignvariableop_64_adam_batch_normalization_6_beta_vIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_65AssignVariableOp*assignvariableop_65_adam_conv2d_5_kernel_vIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_66AssignVariableOp6assignvariableop_66_adam_batch_normalization_7_gamma_vIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_67AssignVariableOp5assignvariableop_67_adam_batch_normalization_7_beta_vIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_68AssignVariableOp*assignvariableop_68_adam_conv2d_6_kernel_vIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_69AssignVariableOp6assignvariableop_69_adam_batch_normalization_8_gamma_vIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_70AssignVariableOp5assignvariableop_70_adam_batch_normalization_8_beta_vIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_71AssignVariableOp*assignvariableop_71_adam_conv2d_7_kernel_vIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_72AssignVariableOp6assignvariableop_72_adam_batch_normalization_9_gamma_vIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:¦
AssignVariableOp_73AssignVariableOp5assignvariableop_73_adam_batch_normalization_9_beta_vIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_74AssignVariableOp)assignvariableop_74_adam_dense_2_kernel_vIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_75AssignVariableOp7assignvariableop_75_adam_batch_normalization_10_gamma_vIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_76AssignVariableOp6assignvariableop_76_adam_batch_normalization_10_beta_vIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_77AssignVariableOp)assignvariableop_77_adam_dense_3_kernel_vIdentity_77:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_78AssignVariableOp7assignvariableop_78_adam_batch_normalization_11_gamma_vIdentity_78:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_79AssignVariableOp6assignvariableop_79_adam_batch_normalization_11_beta_vIdentity_79:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_80AssignVariableOp$assignvariableop_80_adam_pi_kernel_vIdentity_80:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_81AssignVariableOp"assignvariableop_81_adam_pi_bias_vIdentity_81:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_82AssignVariableOp#assignvariableop_82_adam_v_kernel_vIdentity_82:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_83AssignVariableOp!assignvariableop_83_adam_v_bias_vIdentity_83:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 
Identity_84Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_85IdentityIdentity_84:output:0^NoOp_1*
T0*
_output_shapes
: ô
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_85Identity_85:output:0*¿
_input_shapes­
ª: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712*
AssignVariableOp_72AssignVariableOp_722*
AssignVariableOp_73AssignVariableOp_732*
AssignVariableOp_74AssignVariableOp_742*
AssignVariableOp_75AssignVariableOp_752*
AssignVariableOp_76AssignVariableOp_762*
AssignVariableOp_77AssignVariableOp_772*
AssignVariableOp_78AssignVariableOp_782*
AssignVariableOp_79AssignVariableOp_792(
AssignVariableOp_8AssignVariableOp_82*
AssignVariableOp_80AssignVariableOp_802*
AssignVariableOp_81AssignVariableOp_812*
AssignVariableOp_82AssignVariableOp_822*
AssignVariableOp_83AssignVariableOp_832(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
ç
b
F__inference_activation_6_layer_call_and_return_conditional_losses_6119

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç
b
F__inference_activation_7_layer_call_and_return_conditional_losses_4661

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÏV
«

!__inference_internal_grad_fn_7016
result_grads_0
result_grads_1
result_grads_2
result_grads_3
result_grads_4
result_grads_5
result_grads_6
result_grads_7
result_grads_8
result_grads_9
result_grads_10
result_grads_11
result_grads_12
result_grads_13
result_grads_14
result_grads_15
result_grads_16
result_grads_17
result_grads_18
result_grads_19
result_grads_20
result_grads_21
result_grads_22
result_grads_23
result_grads_24
result_grads_25
result_grads_26
result_grads_27
result_grads_28
result_grads_29
result_grads_30
result_grads_31
result_grads_32
result_grads_33
result_grads_34
result_grads_35
result_grads_36
result_grads_37
result_grads_38
result_grads_39
result_grads_40
result_grads_41
result_grads_42
result_grads_43
identity_22
identity_23
identity_24
identity_25
identity_26
identity_27
identity_28
identity_29
identity_30
identity_31
identity_32
identity_33
identity_34
identity_35
identity_36
identity_37
identity_38
identity_39
identity_40
identity_41
identity_42
identity_43U
IdentityIdentityresult_grads_0*
T0*&
_output_shapes
:K

Identity_1Identityresult_grads_1*
T0*
_output_shapes
:K

Identity_2Identityresult_grads_2*
T0*
_output_shapes
:W

Identity_3Identityresult_grads_3*
T0*&
_output_shapes
:K

Identity_4Identityresult_grads_4*
T0*
_output_shapes
:K

Identity_5Identityresult_grads_5*
T0*
_output_shapes
:W

Identity_6Identityresult_grads_6*
T0*&
_output_shapes
:K

Identity_7Identityresult_grads_7*
T0*
_output_shapes
:K

Identity_8Identityresult_grads_8*
T0*
_output_shapes
:W

Identity_9Identityresult_grads_9*
T0*&
_output_shapes
:M
Identity_10Identityresult_grads_10*
T0*
_output_shapes
:M
Identity_11Identityresult_grads_11*
T0*
_output_shapes
:S
Identity_12Identityresult_grads_12*
T0* 
_output_shapes
:
ÀN
Identity_13Identityresult_grads_13*
T0*
_output_shapes	
:N
Identity_14Identityresult_grads_14*
T0*
_output_shapes	
:S
Identity_15Identityresult_grads_15*
T0* 
_output_shapes
:
N
Identity_16Identityresult_grads_16*
T0*
_output_shapes	
:N
Identity_17Identityresult_grads_17*
T0*
_output_shapes	
:S
Identity_18Identityresult_grads_18*
T0* 
_output_shapes
:
 N
Identity_19Identityresult_grads_19*
T0*
_output_shapes	
: R
Identity_20Identityresult_grads_20*
T0*
_output_shapes
:	M
Identity_21Identityresult_grads_21*
T0*
_output_shapes
:

	IdentityN	IdentityNresult_grads_0result_grads_1result_grads_2result_grads_3result_grads_4result_grads_5result_grads_6result_grads_7result_grads_8result_grads_9result_grads_10result_grads_11result_grads_12result_grads_13result_grads_14result_grads_15result_grads_16result_grads_17result_grads_18result_grads_19result_grads_20result_grads_21result_grads_0result_grads_1result_grads_2result_grads_3result_grads_4result_grads_5result_grads_6result_grads_7result_grads_8result_grads_9result_grads_10result_grads_11result_grads_12result_grads_13result_grads_14result_grads_15result_grads_16result_grads_17result_grads_18result_grads_19result_grads_20result_grads_21*5
T0
.2,**
_gradient_op_typeCustomGradient-6927*¶
_output_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	:\
Identity_22IdentityIdentityN:output:0*
T0*&
_output_shapes
:P
Identity_23IdentityIdentityN:output:1*
T0*
_output_shapes
:P
Identity_24IdentityIdentityN:output:2*
T0*
_output_shapes
:\
Identity_25IdentityIdentityN:output:3*
T0*&
_output_shapes
:P
Identity_26IdentityIdentityN:output:4*
T0*
_output_shapes
:P
Identity_27IdentityIdentityN:output:5*
T0*
_output_shapes
:\
Identity_28IdentityIdentityN:output:6*
T0*&
_output_shapes
:P
Identity_29IdentityIdentityN:output:7*
T0*
_output_shapes
:P
Identity_30IdentityIdentityN:output:8*
T0*
_output_shapes
:\
Identity_31IdentityIdentityN:output:9*
T0*&
_output_shapes
:Q
Identity_32IdentityIdentityN:output:10*
T0*
_output_shapes
:Q
Identity_33IdentityIdentityN:output:11*
T0*
_output_shapes
:W
Identity_34IdentityIdentityN:output:12*
T0* 
_output_shapes
:
ÀR
Identity_35IdentityIdentityN:output:13*
T0*
_output_shapes	
:R
Identity_36IdentityIdentityN:output:14*
T0*
_output_shapes	
:W
Identity_37IdentityIdentityN:output:15*
T0* 
_output_shapes
:
R
Identity_38IdentityIdentityN:output:16*
T0*
_output_shapes	
:R
Identity_39IdentityIdentityN:output:17*
T0*
_output_shapes	
:W
Identity_40IdentityIdentityN:output:18*
T0* 
_output_shapes
:
 R
Identity_41IdentityIdentityN:output:19*
T0*
_output_shapes	
: V
Identity_42IdentityIdentityN:output:20*
T0*
_output_shapes
:	Q
Identity_43IdentityIdentityN:output:21*
T0*
_output_shapes
:"#
identity_22Identity_22:output:0"#
identity_23Identity_23:output:0"#
identity_24Identity_24:output:0"#
identity_25Identity_25:output:0"#
identity_26Identity_26:output:0"#
identity_27Identity_27:output:0"#
identity_28Identity_28:output:0"#
identity_29Identity_29:output:0"#
identity_30Identity_30:output:0"#
identity_31Identity_31:output:0"#
identity_32Identity_32:output:0"#
identity_33Identity_33:output:0"#
identity_34Identity_34:output:0"#
identity_35Identity_35:output:0"#
identity_36Identity_36:output:0"#
identity_37Identity_37:output:0"#
identity_38Identity_38:output:0"#
identity_39Identity_39:output:0"#
identity_40Identity_40:output:0"#
identity_41Identity_41:output:0"#
identity_42Identity_42:output:0"#
identity_43Identity_43:output:0*µ
_input_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	::V R
&
_output_shapes
:
(
_user_specified_nameresult_grads_0:JF

_output_shapes
:
(
_user_specified_nameresult_grads_1:JF

_output_shapes
:
(
_user_specified_nameresult_grads_2:VR
&
_output_shapes
:
(
_user_specified_nameresult_grads_3:JF

_output_shapes
:
(
_user_specified_nameresult_grads_4:JF

_output_shapes
:
(
_user_specified_nameresult_grads_5:VR
&
_output_shapes
:
(
_user_specified_nameresult_grads_6:JF

_output_shapes
:
(
_user_specified_nameresult_grads_7:JF

_output_shapes
:
(
_user_specified_nameresult_grads_8:V	R
&
_output_shapes
:
(
_user_specified_nameresult_grads_9:K
G

_output_shapes
:
)
_user_specified_nameresult_grads_10:KG

_output_shapes
:
)
_user_specified_nameresult_grads_11:QM
 
_output_shapes
:
À
)
_user_specified_nameresult_grads_12:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_13:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_14:QM
 
_output_shapes
:

)
_user_specified_nameresult_grads_15:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_16:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_17:QM
 
_output_shapes
:
 
)
_user_specified_nameresult_grads_18:LH

_output_shapes	
: 
)
_user_specified_nameresult_grads_19:PL

_output_shapes
:	
)
_user_specified_nameresult_grads_20:KG

_output_shapes
:
)
_user_specified_nameresult_grads_21:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_22:KG

_output_shapes
:
)
_user_specified_nameresult_grads_23:KG

_output_shapes
:
)
_user_specified_nameresult_grads_24:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_25:KG

_output_shapes
:
)
_user_specified_nameresult_grads_26:KG

_output_shapes
:
)
_user_specified_nameresult_grads_27:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_28:KG

_output_shapes
:
)
_user_specified_nameresult_grads_29:KG

_output_shapes
:
)
_user_specified_nameresult_grads_30:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_31:K G

_output_shapes
:
)
_user_specified_nameresult_grads_32:K!G

_output_shapes
:
)
_user_specified_nameresult_grads_33:Q"M
 
_output_shapes
:
À
)
_user_specified_nameresult_grads_34:L#H

_output_shapes	
:
)
_user_specified_nameresult_grads_35:L$H

_output_shapes	
:
)
_user_specified_nameresult_grads_36:Q%M
 
_output_shapes
:

)
_user_specified_nameresult_grads_37:L&H

_output_shapes	
:
)
_user_specified_nameresult_grads_38:L'H

_output_shapes	
:
)
_user_specified_nameresult_grads_39:Q(M
 
_output_shapes
:
 
)
_user_specified_nameresult_grads_40:L)H

_output_shapes	
: 
)
_user_specified_nameresult_grads_41:P*L

_output_shapes
:	
)
_user_specified_nameresult_grads_42:K+G

_output_shapes
:
)
_user_specified_nameresult_grads_43
®%
í
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4591

inputs6
'assignmovingavg_readvariableop_resource:	8
)assignmovingavg_1_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	0
!batchnorm_readvariableop_resource:	
identity¢AssignMovingAvg¢AssignMovingAvg/ReadVariableOp¢AssignMovingAvg_1¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(e
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(n
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 t
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:y
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:¬
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:´
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:r
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:w
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0q
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿê
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6367

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ú
a
C__inference_dropout_3_layer_call_and_return_conditional_losses_6638

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç
b
F__inference_activation_9_layer_call_and_return_conditional_losses_6377

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Å
_
C__inference_flatten_1_layer_call_and_return_conditional_losses_6388

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÏÊ
#
__inference_validate_step_4179
x
pi
vI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
mul_1_x
identity

identity_1

identity_2¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ \
subSubmodel_1/v/Tanh:y:0v*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿJ
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowsub:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       F
MeanMeanpow:z:0Const:output:0*
T0*
_output_shapes
: A
NegNegpi*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [
LogLogmodel_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ O
mulMulNeg:y:0Log:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ X
Const_1Const*
_output_shapes
:*
dtype0*
valueB"       J
Mean_1Meanmul:z:0Const_1:output:0*
T0*
_output_shapes
: G
mul_1Mulmul_1_xMean_1:output:0*
T0*
_output_shapes
: G
addAddV2Mean:output:0	mul_1:z:0*
T0*
_output_shapes
: K
IdentityIdentityMean:output:0^NoOp*
T0*
_output_shapes
: O

Identity_1IdentityMean_1:output:0^NoOp*
T0*
_output_shapes
: G

Identity_2Identityadd:z:0^NoOp*
T0*
_output_shapes
: ®
NoOpNoOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:LH
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:%

_output_shapes
: 
¹

!__inference_pi_layer_call_fn_6659

inputs
unknown:
 
	unknown_0:	 
identity¢StatefulPartitionedCallÒ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *E
f@R>
<__inference_pi_layer_call_and_return_conditional_losses_4821p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4235

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6195

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ø
ì"
A__inference_model_1_layer_call_and_return_conditional_losses_6033

inputsA
'conv2d_4_conv2d_readvariableop_resource:;
-batch_normalization_6_readvariableop_resource:=
/batch_normalization_6_readvariableop_1_resource:L
>batch_normalization_6_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_5_conv2d_readvariableop_resource:;
-batch_normalization_7_readvariableop_resource:=
/batch_normalization_7_readvariableop_1_resource:L
>batch_normalization_7_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_6_conv2d_readvariableop_resource:;
-batch_normalization_8_readvariableop_resource:=
/batch_normalization_8_readvariableop_1_resource:L
>batch_normalization_8_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_7_conv2d_readvariableop_resource:;
-batch_normalization_9_readvariableop_resource:=
/batch_normalization_9_readvariableop_1_resource:L
>batch_normalization_9_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource::
&dense_2_matmul_readvariableop_resource:
ÀM
>batch_normalization_10_assignmovingavg_readvariableop_resource:	O
@batch_normalization_10_assignmovingavg_1_readvariableop_resource:	K
<batch_normalization_10_batchnorm_mul_readvariableop_resource:	G
8batch_normalization_10_batchnorm_readvariableop_resource:	:
&dense_3_matmul_readvariableop_resource:
M
>batch_normalization_11_assignmovingavg_readvariableop_resource:	O
@batch_normalization_11_assignmovingavg_1_readvariableop_resource:	K
<batch_normalization_11_batchnorm_mul_readvariableop_resource:	G
8batch_normalization_11_batchnorm_readvariableop_resource:	3
 v_matmul_readvariableop_resource:	/
!v_biasadd_readvariableop_resource:5
!pi_matmul_readvariableop_resource:
 1
"pi_biasadd_readvariableop_resource:	 
identity

identity_1¢&batch_normalization_10/AssignMovingAvg¢5batch_normalization_10/AssignMovingAvg/ReadVariableOp¢(batch_normalization_10/AssignMovingAvg_1¢7batch_normalization_10/AssignMovingAvg_1/ReadVariableOp¢/batch_normalization_10/batchnorm/ReadVariableOp¢3batch_normalization_10/batchnorm/mul/ReadVariableOp¢&batch_normalization_11/AssignMovingAvg¢5batch_normalization_11/AssignMovingAvg/ReadVariableOp¢(batch_normalization_11/AssignMovingAvg_1¢7batch_normalization_11/AssignMovingAvg_1/ReadVariableOp¢/batch_normalization_11/batchnorm/ReadVariableOp¢3batch_normalization_11/batchnorm/mul/ReadVariableOp¢$batch_normalization_6/AssignNewValue¢&batch_normalization_6/AssignNewValue_1¢5batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_6/ReadVariableOp¢&batch_normalization_6/ReadVariableOp_1¢$batch_normalization_7/AssignNewValue¢&batch_normalization_7/AssignNewValue_1¢5batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_7/ReadVariableOp¢&batch_normalization_7/ReadVariableOp_1¢$batch_normalization_8/AssignNewValue¢&batch_normalization_8/AssignNewValue_1¢5batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_8/ReadVariableOp¢&batch_normalization_8/ReadVariableOp_1¢$batch_normalization_9/AssignNewValue¢&batch_normalization_9/AssignNewValue_1¢5batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_9/ReadVariableOp¢&batch_normalization_9/ReadVariableOp_1¢conv2d_4/Conv2D/ReadVariableOp¢conv2d_5/Conv2D/ReadVariableOp¢conv2d_6/Conv2D/ReadVariableOp¢conv2d_7/Conv2D/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢dense_3/MatMul/ReadVariableOp¢pi/BiasAdd/ReadVariableOp¢pi/MatMul/ReadVariableOp¢v/BiasAdd/ReadVariableOp¢v/MatMul/ReadVariableOp
conv2d_4/Conv2D/ReadVariableOpReadVariableOp'conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0«
conv2d_4/Conv2DConv2Dinputs&conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

$batch_normalization_6/ReadVariableOpReadVariableOp-batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_6/ReadVariableOp_1ReadVariableOp/batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ä
&batch_normalization_6/FusedBatchNormV3FusedBatchNormV3conv2d_4/Conv2D:output:0,batch_normalization_6/ReadVariableOp:value:0.batch_normalization_6/ReadVariableOp_1:value:0=batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<
$batch_normalization_6/AssignNewValueAssignVariableOp>batch_normalization_6_fusedbatchnormv3_readvariableop_resource3batch_normalization_6/FusedBatchNormV3:batch_mean:06^batch_normalization_6/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
&batch_normalization_6/AssignNewValue_1AssignVariableOp@batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource7batch_normalization_6/FusedBatchNormV3:batch_variance:08^batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
activation_6/EluElu*batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_5/Conv2D/ReadVariableOpReadVariableOp'conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ã
conv2d_5/Conv2DConv2Dactivation_6/Elu:activations:0&conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

$batch_normalization_7/ReadVariableOpReadVariableOp-batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_7/ReadVariableOp_1ReadVariableOp/batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ä
&batch_normalization_7/FusedBatchNormV3FusedBatchNormV3conv2d_5/Conv2D:output:0,batch_normalization_7/ReadVariableOp:value:0.batch_normalization_7/ReadVariableOp_1:value:0=batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<
$batch_normalization_7/AssignNewValueAssignVariableOp>batch_normalization_7_fusedbatchnormv3_readvariableop_resource3batch_normalization_7/FusedBatchNormV3:batch_mean:06^batch_normalization_7/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
&batch_normalization_7/AssignNewValue_1AssignVariableOp@batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource7batch_normalization_7/FusedBatchNormV3:batch_variance:08^batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
activation_7/EluElu*batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_6/Conv2D/ReadVariableOpReadVariableOp'conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ä
conv2d_6/Conv2DConv2Dactivation_7/Elu:activations:0&conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

$batch_normalization_8/ReadVariableOpReadVariableOp-batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_8/ReadVariableOp_1ReadVariableOp/batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ä
&batch_normalization_8/FusedBatchNormV3FusedBatchNormV3conv2d_6/Conv2D:output:0,batch_normalization_8/ReadVariableOp:value:0.batch_normalization_8/ReadVariableOp_1:value:0=batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<
$batch_normalization_8/AssignNewValueAssignVariableOp>batch_normalization_8_fusedbatchnormv3_readvariableop_resource3batch_normalization_8/FusedBatchNormV3:batch_mean:06^batch_normalization_8/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
&batch_normalization_8/AssignNewValue_1AssignVariableOp@batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource7batch_normalization_8/FusedBatchNormV3:batch_variance:08^batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
activation_8/EluElu*batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_7/Conv2D/ReadVariableOpReadVariableOp'conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ä
conv2d_7/Conv2DConv2Dactivation_8/Elu:activations:0&conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

$batch_normalization_9/ReadVariableOpReadVariableOp-batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_9/ReadVariableOp_1ReadVariableOp/batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ä
&batch_normalization_9/FusedBatchNormV3FusedBatchNormV3conv2d_7/Conv2D:output:0,batch_normalization_9/ReadVariableOp:value:0.batch_normalization_9/ReadVariableOp_1:value:0=batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<
$batch_normalization_9/AssignNewValueAssignVariableOp>batch_normalization_9_fusedbatchnormv3_readvariableop_resource3batch_normalization_9/FusedBatchNormV3:batch_mean:06^batch_normalization_9/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
&batch_normalization_9/AssignNewValue_1AssignVariableOp@batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource7batch_normalization_9/FusedBatchNormV3:batch_variance:08^batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
activation_9/EluElu*batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   
flatten_1/ReshapeReshapeactivation_9/Elu:activations:0flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0
dense_2/MatMulMatMulflatten_1/Reshape:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
5batch_normalization_10/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: À
#batch_normalization_10/moments/meanMeandense_2/MatMul:product:0>batch_normalization_10/moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(
+batch_normalization_10/moments/StopGradientStopGradient,batch_normalization_10/moments/mean:output:0*
T0*
_output_shapes
:	È
0batch_normalization_10/moments/SquaredDifferenceSquaredDifferencedense_2/MatMul:product:04batch_normalization_10/moments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
9batch_normalization_10/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ä
'batch_normalization_10/moments/varianceMean4batch_normalization_10/moments/SquaredDifference:z:0Bbatch_normalization_10/moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(
&batch_normalization_10/moments/SqueezeSqueeze,batch_normalization_10/moments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 ¢
(batch_normalization_10/moments/Squeeze_1Squeeze0batch_normalization_10/moments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 q
,batch_normalization_10/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<±
5batch_normalization_10/AssignMovingAvg/ReadVariableOpReadVariableOp>batch_normalization_10_assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0Ç
*batch_normalization_10/AssignMovingAvg/subSub=batch_normalization_10/AssignMovingAvg/ReadVariableOp:value:0/batch_normalization_10/moments/Squeeze:output:0*
T0*
_output_shapes	
:¾
*batch_normalization_10/AssignMovingAvg/mulMul.batch_normalization_10/AssignMovingAvg/sub:z:05batch_normalization_10/AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:
&batch_normalization_10/AssignMovingAvgAssignSubVariableOp>batch_normalization_10_assignmovingavg_readvariableop_resource.batch_normalization_10/AssignMovingAvg/mul:z:06^batch_normalization_10/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0s
.batch_normalization_10/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<µ
7batch_normalization_10/AssignMovingAvg_1/ReadVariableOpReadVariableOp@batch_normalization_10_assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0Í
,batch_normalization_10/AssignMovingAvg_1/subSub?batch_normalization_10/AssignMovingAvg_1/ReadVariableOp:value:01batch_normalization_10/moments/Squeeze_1:output:0*
T0*
_output_shapes	
:Ä
,batch_normalization_10/AssignMovingAvg_1/mulMul0batch_normalization_10/AssignMovingAvg_1/sub:z:07batch_normalization_10/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:
(batch_normalization_10/AssignMovingAvg_1AssignSubVariableOp@batch_normalization_10_assignmovingavg_1_readvariableop_resource0batch_normalization_10/AssignMovingAvg_1/mul:z:08^batch_normalization_10/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0k
&batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:·
$batch_normalization_10/batchnorm/addAddV21batch_normalization_10/moments/Squeeze_1:output:0/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
&batch_normalization_10/batchnorm/RsqrtRsqrt(batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:­
3batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOp<batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0º
$batch_normalization_10/batchnorm/mulMul*batch_normalization_10/batchnorm/Rsqrt:y:0;batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¤
&batch_normalization_10/batchnorm/mul_1Muldense_2/MatMul:product:0(batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
&batch_normalization_10/batchnorm/mul_2Mul/batch_normalization_10/moments/Squeeze:output:0(batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¥
/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp8batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0¶
$batch_normalization_10/batchnorm/subSub7batch_normalization_10/batchnorm/ReadVariableOp:value:0*batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:¸
&batch_normalization_10/batchnorm/add_1AddV2*batch_normalization_10/batchnorm/mul_1:z:0(batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
activation_10/EluElu*batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @
dropout_2/dropout/MulMulactivation_10/Elu:activations:0 dropout_2/dropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿf
dropout_2/dropout/ShapeShapeactivation_10/Elu:activations:0*
T0*
_output_shapes
:¡
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0e
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Å
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_3/MatMulMatMuldropout_2/dropout/Mul_1:z:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
5batch_normalization_11/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: À
#batch_normalization_11/moments/meanMeandense_3/MatMul:product:0>batch_normalization_11/moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(
+batch_normalization_11/moments/StopGradientStopGradient,batch_normalization_11/moments/mean:output:0*
T0*
_output_shapes
:	È
0batch_normalization_11/moments/SquaredDifferenceSquaredDifferencedense_3/MatMul:product:04batch_normalization_11/moments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
9batch_normalization_11/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ä
'batch_normalization_11/moments/varianceMean4batch_normalization_11/moments/SquaredDifference:z:0Bbatch_normalization_11/moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(
&batch_normalization_11/moments/SqueezeSqueeze,batch_normalization_11/moments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 ¢
(batch_normalization_11/moments/Squeeze_1Squeeze0batch_normalization_11/moments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 q
,batch_normalization_11/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<±
5batch_normalization_11/AssignMovingAvg/ReadVariableOpReadVariableOp>batch_normalization_11_assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0Ç
*batch_normalization_11/AssignMovingAvg/subSub=batch_normalization_11/AssignMovingAvg/ReadVariableOp:value:0/batch_normalization_11/moments/Squeeze:output:0*
T0*
_output_shapes	
:¾
*batch_normalization_11/AssignMovingAvg/mulMul.batch_normalization_11/AssignMovingAvg/sub:z:05batch_normalization_11/AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:
&batch_normalization_11/AssignMovingAvgAssignSubVariableOp>batch_normalization_11_assignmovingavg_readvariableop_resource.batch_normalization_11/AssignMovingAvg/mul:z:06^batch_normalization_11/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0s
.batch_normalization_11/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<µ
7batch_normalization_11/AssignMovingAvg_1/ReadVariableOpReadVariableOp@batch_normalization_11_assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0Í
,batch_normalization_11/AssignMovingAvg_1/subSub?batch_normalization_11/AssignMovingAvg_1/ReadVariableOp:value:01batch_normalization_11/moments/Squeeze_1:output:0*
T0*
_output_shapes	
:Ä
,batch_normalization_11/AssignMovingAvg_1/mulMul0batch_normalization_11/AssignMovingAvg_1/sub:z:07batch_normalization_11/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:
(batch_normalization_11/AssignMovingAvg_1AssignSubVariableOp@batch_normalization_11_assignmovingavg_1_readvariableop_resource0batch_normalization_11/AssignMovingAvg_1/mul:z:08^batch_normalization_11/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0k
&batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:·
$batch_normalization_11/batchnorm/addAddV21batch_normalization_11/moments/Squeeze_1:output:0/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
&batch_normalization_11/batchnorm/RsqrtRsqrt(batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:­
3batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOp<batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0º
$batch_normalization_11/batchnorm/mulMul*batch_normalization_11/batchnorm/Rsqrt:y:0;batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¤
&batch_normalization_11/batchnorm/mul_1Muldense_3/MatMul:product:0(batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
&batch_normalization_11/batchnorm/mul_2Mul/batch_normalization_11/moments/Squeeze:output:0(batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¥
/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp8batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0¶
$batch_normalization_11/batchnorm/subSub7batch_normalization_11/batchnorm/ReadVariableOp:value:0*batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:¸
&batch_normalization_11/batchnorm/add_1AddV2*batch_normalization_11/batchnorm/mul_1:z:0(batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
activation_11/EluElu*batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
dropout_3/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @
dropout_3/dropout/MulMulactivation_11/Elu:activations:0 dropout_3/dropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿf
dropout_3/dropout/ShapeShapeactivation_11/Elu:activations:0*
T0*
_output_shapes
:¡
.dropout_3/dropout/random_uniform/RandomUniformRandomUniform dropout_3/dropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0e
 dropout_3/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Å
dropout_3/dropout/GreaterEqualGreaterEqual7dropout_3/dropout/random_uniform/RandomUniform:output:0)dropout_3/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_3/dropout/CastCast"dropout_3/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_3/dropout/Mul_1Muldropout_3/dropout/Mul:z:0dropout_3/dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
v/MatMul/ReadVariableOpReadVariableOp v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
v/MatMulMatMuldropout_3/dropout/Mul_1:z:0v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
v/BiasAdd/ReadVariableOpReadVariableOp!v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0|
	v/BiasAddBiasAddv/MatMul:product:0 v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
v/TanhTanhv/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
pi/MatMul/ReadVariableOpReadVariableOp!pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
	pi/MatMulMatMuldropout_3/dropout/Mul_1:z:0 pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ y
pi/BiasAdd/ReadVariableOpReadVariableOp"pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0

pi/BiasAddBiasAddpi/MatMul:product:0!pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ ]

pi/SoftmaxSoftmaxpi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ d
IdentityIdentitypi/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [

Identity_1Identity
v/Tanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp'^batch_normalization_10/AssignMovingAvg6^batch_normalization_10/AssignMovingAvg/ReadVariableOp)^batch_normalization_10/AssignMovingAvg_18^batch_normalization_10/AssignMovingAvg_1/ReadVariableOp0^batch_normalization_10/batchnorm/ReadVariableOp4^batch_normalization_10/batchnorm/mul/ReadVariableOp'^batch_normalization_11/AssignMovingAvg6^batch_normalization_11/AssignMovingAvg/ReadVariableOp)^batch_normalization_11/AssignMovingAvg_18^batch_normalization_11/AssignMovingAvg_1/ReadVariableOp0^batch_normalization_11/batchnorm/ReadVariableOp4^batch_normalization_11/batchnorm/mul/ReadVariableOp%^batch_normalization_6/AssignNewValue'^batch_normalization_6/AssignNewValue_16^batch_normalization_6/FusedBatchNormV3/ReadVariableOp8^batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_6/ReadVariableOp'^batch_normalization_6/ReadVariableOp_1%^batch_normalization_7/AssignNewValue'^batch_normalization_7/AssignNewValue_16^batch_normalization_7/FusedBatchNormV3/ReadVariableOp8^batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_7/ReadVariableOp'^batch_normalization_7/ReadVariableOp_1%^batch_normalization_8/AssignNewValue'^batch_normalization_8/AssignNewValue_16^batch_normalization_8/FusedBatchNormV3/ReadVariableOp8^batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_8/ReadVariableOp'^batch_normalization_8/ReadVariableOp_1%^batch_normalization_9/AssignNewValue'^batch_normalization_9/AssignNewValue_16^batch_normalization_9/FusedBatchNormV3/ReadVariableOp8^batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_9/ReadVariableOp'^batch_normalization_9/ReadVariableOp_1^conv2d_4/Conv2D/ReadVariableOp^conv2d_5/Conv2D/ReadVariableOp^conv2d_6/Conv2D/ReadVariableOp^conv2d_7/Conv2D/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/MatMul/ReadVariableOp^pi/BiasAdd/ReadVariableOp^pi/MatMul/ReadVariableOp^v/BiasAdd/ReadVariableOp^v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2P
&batch_normalization_10/AssignMovingAvg&batch_normalization_10/AssignMovingAvg2n
5batch_normalization_10/AssignMovingAvg/ReadVariableOp5batch_normalization_10/AssignMovingAvg/ReadVariableOp2T
(batch_normalization_10/AssignMovingAvg_1(batch_normalization_10/AssignMovingAvg_12r
7batch_normalization_10/AssignMovingAvg_1/ReadVariableOp7batch_normalization_10/AssignMovingAvg_1/ReadVariableOp2b
/batch_normalization_10/batchnorm/ReadVariableOp/batch_normalization_10/batchnorm/ReadVariableOp2j
3batch_normalization_10/batchnorm/mul/ReadVariableOp3batch_normalization_10/batchnorm/mul/ReadVariableOp2P
&batch_normalization_11/AssignMovingAvg&batch_normalization_11/AssignMovingAvg2n
5batch_normalization_11/AssignMovingAvg/ReadVariableOp5batch_normalization_11/AssignMovingAvg/ReadVariableOp2T
(batch_normalization_11/AssignMovingAvg_1(batch_normalization_11/AssignMovingAvg_12r
7batch_normalization_11/AssignMovingAvg_1/ReadVariableOp7batch_normalization_11/AssignMovingAvg_1/ReadVariableOp2b
/batch_normalization_11/batchnorm/ReadVariableOp/batch_normalization_11/batchnorm/ReadVariableOp2j
3batch_normalization_11/batchnorm/mul/ReadVariableOp3batch_normalization_11/batchnorm/mul/ReadVariableOp2L
$batch_normalization_6/AssignNewValue$batch_normalization_6/AssignNewValue2P
&batch_normalization_6/AssignNewValue_1&batch_normalization_6/AssignNewValue_12n
5batch_normalization_6/FusedBatchNormV3/ReadVariableOp5batch_normalization_6/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_17batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_6/ReadVariableOp$batch_normalization_6/ReadVariableOp2P
&batch_normalization_6/ReadVariableOp_1&batch_normalization_6/ReadVariableOp_12L
$batch_normalization_7/AssignNewValue$batch_normalization_7/AssignNewValue2P
&batch_normalization_7/AssignNewValue_1&batch_normalization_7/AssignNewValue_12n
5batch_normalization_7/FusedBatchNormV3/ReadVariableOp5batch_normalization_7/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_17batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_7/ReadVariableOp$batch_normalization_7/ReadVariableOp2P
&batch_normalization_7/ReadVariableOp_1&batch_normalization_7/ReadVariableOp_12L
$batch_normalization_8/AssignNewValue$batch_normalization_8/AssignNewValue2P
&batch_normalization_8/AssignNewValue_1&batch_normalization_8/AssignNewValue_12n
5batch_normalization_8/FusedBatchNormV3/ReadVariableOp5batch_normalization_8/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_17batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_8/ReadVariableOp$batch_normalization_8/ReadVariableOp2P
&batch_normalization_8/ReadVariableOp_1&batch_normalization_8/ReadVariableOp_12L
$batch_normalization_9/AssignNewValue$batch_normalization_9/AssignNewValue2P
&batch_normalization_9/AssignNewValue_1&batch_normalization_9/AssignNewValue_12n
5batch_normalization_9/FusedBatchNormV3/ReadVariableOp5batch_normalization_9/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_17batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_9/ReadVariableOp$batch_normalization_9/ReadVariableOp2P
&batch_normalization_9/ReadVariableOp_1&batch_normalization_9/ReadVariableOp_12@
conv2d_4/Conv2D/ReadVariableOpconv2d_4/Conv2D/ReadVariableOp2@
conv2d_5/Conv2D/ReadVariableOpconv2d_5/Conv2D/ReadVariableOp2@
conv2d_6/Conv2D/ReadVariableOpconv2d_6/Conv2D/ReadVariableOp2@
conv2d_7/Conv2D/ReadVariableOpconv2d_7/Conv2D/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp26
pi/BiasAdd/ReadVariableOppi/BiasAdd/ReadVariableOp24
pi/MatMul/ReadVariableOppi/MatMul/ReadVariableOp24
v/BiasAdd/ReadVariableOpv/BiasAdd/ReadVariableOp22
v/MatMul/ReadVariableOpv/MatMul/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ü£
Ö
 __inference_reset_optimizer_2600
options#
assignvariableop_resource:	 5
assignvariableop_1_resource:)
assignvariableop_2_resource:)
assignvariableop_3_resource:5
assignvariableop_4_resource:)
assignvariableop_5_resource:)
assignvariableop_6_resource:5
assignvariableop_7_resource:)
assignvariableop_8_resource:)
assignvariableop_9_resource:6
assignvariableop_10_resource:*
assignvariableop_11_resource:*
assignvariableop_12_resource:0
assignvariableop_13_resource:
À+
assignvariableop_14_resource:	+
assignvariableop_15_resource:	0
assignvariableop_16_resource:
+
assignvariableop_17_resource:	+
assignvariableop_18_resource:	0
assignvariableop_19_resource:
 +
assignvariableop_20_resource:	 /
assignvariableop_21_resource:	*
assignvariableop_22_resource:6
assignvariableop_23_resource:*
assignvariableop_24_resource:*
assignvariableop_25_resource:6
assignvariableop_26_resource:*
assignvariableop_27_resource:*
assignvariableop_28_resource:6
assignvariableop_29_resource:*
assignvariableop_30_resource:*
assignvariableop_31_resource:6
assignvariableop_32_resource:*
assignvariableop_33_resource:*
assignvariableop_34_resource:0
assignvariableop_35_resource:
À+
assignvariableop_36_resource:	+
assignvariableop_37_resource:	0
assignvariableop_38_resource:
+
assignvariableop_39_resource:	+
assignvariableop_40_resource:	0
assignvariableop_41_resource:
 +
assignvariableop_42_resource:	 /
assignvariableop_43_resource:	*
assignvariableop_44_resource:
identity¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_31¢AssignVariableOp_32¢AssignVariableOp_33¢AssignVariableOp_34¢AssignVariableOp_35¢AssignVariableOp_36¢AssignVariableOp_37¢AssignVariableOp_38¢AssignVariableOp_39¢AssignVariableOp_4¢AssignVariableOp_40¢AssignVariableOp_41¢AssignVariableOp_42¢AssignVariableOp_43¢AssignVariableOp_44¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9L

zeros_likeConst*
_output_shapes
: *
dtype0	*
value	B	 R w
AssignVariableOpAssignVariableOpassignvariableop_resourcezeros_like:output:0*
_output_shapes
 *
dtype0	q
zeros_like_1Const*&
_output_shapes
:*
dtype0*%
valueB*    }
AssignVariableOp_1AssignVariableOpassignvariableop_1_resourcezeros_like_1:output:0*
_output_shapes
 *
dtype0Y
zeros_like_2Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_2AssignVariableOpassignvariableop_2_resourcezeros_like_2:output:0*
_output_shapes
 *
dtype0Y
zeros_like_3Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_3AssignVariableOpassignvariableop_3_resourcezeros_like_3:output:0*
_output_shapes
 *
dtype0u
zeros_like_4/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            W
zeros_like_4/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_4Fill%zeros_like_4/shape_as_tensor:output:0zeros_like_4/Const:output:0*
T0*&
_output_shapes
:}
AssignVariableOp_4AssignVariableOpassignvariableop_4_resourcezeros_like_4:output:0*
_output_shapes
 *
dtype0Y
zeros_like_5Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_5AssignVariableOpassignvariableop_5_resourcezeros_like_5:output:0*
_output_shapes
 *
dtype0Y
zeros_like_6Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_6AssignVariableOpassignvariableop_6_resourcezeros_like_6:output:0*
_output_shapes
 *
dtype0u
zeros_like_7/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            W
zeros_like_7/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_7Fill%zeros_like_7/shape_as_tensor:output:0zeros_like_7/Const:output:0*
T0*&
_output_shapes
:}
AssignVariableOp_7AssignVariableOpassignvariableop_7_resourcezeros_like_7:output:0*
_output_shapes
 *
dtype0Y
zeros_like_8Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_8AssignVariableOpassignvariableop_8_resourcezeros_like_8:output:0*
_output_shapes
 *
dtype0Y
zeros_like_9Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_9AssignVariableOpassignvariableop_9_resourcezeros_like_9:output:0*
_output_shapes
 *
dtype0v
zeros_like_10/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_10/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_10Fill&zeros_like_10/shape_as_tensor:output:0zeros_like_10/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_10AssignVariableOpassignvariableop_10_resourcezeros_like_10:output:0*
_output_shapes
 *
dtype0Z
zeros_like_11Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_11AssignVariableOpassignvariableop_11_resourcezeros_like_11:output:0*
_output_shapes
 *
dtype0Z
zeros_like_12Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_12AssignVariableOpassignvariableop_12_resourcezeros_like_12:output:0*
_output_shapes
 *
dtype0n
zeros_like_13/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"À      X
zeros_like_13/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_13Fill&zeros_like_13/shape_as_tensor:output:0zeros_like_13/Const:output:0*
T0* 
_output_shapes
:
À
AssignVariableOp_13AssignVariableOpassignvariableop_13_resourcezeros_like_13:output:0*
_output_shapes
 *
dtype0h
zeros_like_14/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_14/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_14Fill&zeros_like_14/shape_as_tensor:output:0zeros_like_14/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_14AssignVariableOpassignvariableop_14_resourcezeros_like_14:output:0*
_output_shapes
 *
dtype0h
zeros_like_15/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_15/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_15Fill&zeros_like_15/shape_as_tensor:output:0zeros_like_15/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_15AssignVariableOpassignvariableop_15_resourcezeros_like_15:output:0*
_output_shapes
 *
dtype0n
zeros_like_16/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_16/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_16Fill&zeros_like_16/shape_as_tensor:output:0zeros_like_16/Const:output:0*
T0* 
_output_shapes
:

AssignVariableOp_16AssignVariableOpassignvariableop_16_resourcezeros_like_16:output:0*
_output_shapes
 *
dtype0\
zeros_like_17Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_17AssignVariableOpassignvariableop_17_resourcezeros_like_17:output:0*
_output_shapes
 *
dtype0\
zeros_like_18Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_18AssignVariableOpassignvariableop_18_resourcezeros_like_18:output:0*
_output_shapes
 *
dtype0n
zeros_like_19/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_19/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_19Fill&zeros_like_19/shape_as_tensor:output:0zeros_like_19/Const:output:0*
T0* 
_output_shapes
:
 
AssignVariableOp_19AssignVariableOpassignvariableop_19_resourcezeros_like_19:output:0*
_output_shapes
 *
dtype0h
zeros_like_20/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB: X
zeros_like_20/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_20Fill&zeros_like_20/shape_as_tensor:output:0zeros_like_20/Const:output:0*
T0*
_output_shapes	
: 
AssignVariableOp_20AssignVariableOpassignvariableop_20_resourcezeros_like_20:output:0*
_output_shapes
 *
dtype0d
zeros_like_21Const*
_output_shapes
:	*
dtype0*
valueB	*    
AssignVariableOp_21AssignVariableOpassignvariableop_21_resourcezeros_like_21:output:0*
_output_shapes
 *
dtype0Z
zeros_like_22Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_22AssignVariableOpassignvariableop_22_resourcezeros_like_22:output:0*
_output_shapes
 *
dtype0r
zeros_like_23Const*&
_output_shapes
:*
dtype0*%
valueB*    
AssignVariableOp_23AssignVariableOpassignvariableop_23_resourcezeros_like_23:output:0*
_output_shapes
 *
dtype0Z
zeros_like_24Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_24AssignVariableOpassignvariableop_24_resourcezeros_like_24:output:0*
_output_shapes
 *
dtype0Z
zeros_like_25Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_25AssignVariableOpassignvariableop_25_resourcezeros_like_25:output:0*
_output_shapes
 *
dtype0v
zeros_like_26/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_26/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_26Fill&zeros_like_26/shape_as_tensor:output:0zeros_like_26/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_26AssignVariableOpassignvariableop_26_resourcezeros_like_26:output:0*
_output_shapes
 *
dtype0Z
zeros_like_27Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_27AssignVariableOpassignvariableop_27_resourcezeros_like_27:output:0*
_output_shapes
 *
dtype0Z
zeros_like_28Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_28AssignVariableOpassignvariableop_28_resourcezeros_like_28:output:0*
_output_shapes
 *
dtype0v
zeros_like_29/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_29/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_29Fill&zeros_like_29/shape_as_tensor:output:0zeros_like_29/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_29AssignVariableOpassignvariableop_29_resourcezeros_like_29:output:0*
_output_shapes
 *
dtype0Z
zeros_like_30Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_30AssignVariableOpassignvariableop_30_resourcezeros_like_30:output:0*
_output_shapes
 *
dtype0Z
zeros_like_31Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_31AssignVariableOpassignvariableop_31_resourcezeros_like_31:output:0*
_output_shapes
 *
dtype0v
zeros_like_32/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_32/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_32Fill&zeros_like_32/shape_as_tensor:output:0zeros_like_32/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_32AssignVariableOpassignvariableop_32_resourcezeros_like_32:output:0*
_output_shapes
 *
dtype0Z
zeros_like_33Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_33AssignVariableOpassignvariableop_33_resourcezeros_like_33:output:0*
_output_shapes
 *
dtype0Z
zeros_like_34Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_34AssignVariableOpassignvariableop_34_resourcezeros_like_34:output:0*
_output_shapes
 *
dtype0n
zeros_like_35/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"À      X
zeros_like_35/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_35Fill&zeros_like_35/shape_as_tensor:output:0zeros_like_35/Const:output:0*
T0* 
_output_shapes
:
À
AssignVariableOp_35AssignVariableOpassignvariableop_35_resourcezeros_like_35:output:0*
_output_shapes
 *
dtype0h
zeros_like_36/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_36/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_36Fill&zeros_like_36/shape_as_tensor:output:0zeros_like_36/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_36AssignVariableOpassignvariableop_36_resourcezeros_like_36:output:0*
_output_shapes
 *
dtype0h
zeros_like_37/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_37/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_37Fill&zeros_like_37/shape_as_tensor:output:0zeros_like_37/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_37AssignVariableOpassignvariableop_37_resourcezeros_like_37:output:0*
_output_shapes
 *
dtype0n
zeros_like_38/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_38/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_38Fill&zeros_like_38/shape_as_tensor:output:0zeros_like_38/Const:output:0*
T0* 
_output_shapes
:

AssignVariableOp_38AssignVariableOpassignvariableop_38_resourcezeros_like_38:output:0*
_output_shapes
 *
dtype0\
zeros_like_39Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_39AssignVariableOpassignvariableop_39_resourcezeros_like_39:output:0*
_output_shapes
 *
dtype0\
zeros_like_40Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_40AssignVariableOpassignvariableop_40_resourcezeros_like_40:output:0*
_output_shapes
 *
dtype0n
zeros_like_41/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_41/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_41Fill&zeros_like_41/shape_as_tensor:output:0zeros_like_41/Const:output:0*
T0* 
_output_shapes
:
 
AssignVariableOp_41AssignVariableOpassignvariableop_41_resourcezeros_like_41:output:0*
_output_shapes
 *
dtype0h
zeros_like_42/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB: X
zeros_like_42/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_42Fill&zeros_like_42/shape_as_tensor:output:0zeros_like_42/Const:output:0*
T0*
_output_shapes	
: 
AssignVariableOp_42AssignVariableOpassignvariableop_42_resourcezeros_like_42:output:0*
_output_shapes
 *
dtype0d
zeros_like_43Const*
_output_shapes
:	*
dtype0*
valueB	*    
AssignVariableOp_43AssignVariableOpassignvariableop_43_resourcezeros_like_43:output:0*
_output_shapes
 *
dtype0Z
zeros_like_44Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_44AssignVariableOpassignvariableop_44_resourcezeros_like_44:output:0*
_output_shapes
 *
dtype0E
IdentityIdentityoptions^NoOp*
T0*
_output_shapes
: 
NoOpNoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*o
_input_shapes^
\: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:? ;

_output_shapes
: 
!
_user_specified_name	options
ç
b
F__inference_activation_9_layer_call_and_return_conditional_losses_4715

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
³
õ

"__inference_signature_wrapper_3111
options
unknown:	 #
	unknown_0:
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:#
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:
À

unknown_13:	

unknown_14:	

unknown_15:


unknown_16:	

unknown_17:	

unknown_18:
 

unknown_19:	 

unknown_20:	

unknown_21:$

unknown_22:

unknown_23:

unknown_24:$

unknown_25:

unknown_26:

unknown_27:$

unknown_28:

unknown_29:

unknown_30:$

unknown_31:

unknown_32:

unknown_33:

unknown_34:
À

unknown_35:	

unknown_36:	

unknown_37:


unknown_38:	

unknown_39:	

unknown_40:
 

unknown_41:	 

unknown_42:	

unknown_43:
identity¢StatefulPartitionedCallÇ
StatefulPartitionedCallStatefulPartitionedCalloptionsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference_reset_optimizer_2600^
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*o
_input_shapes^
\: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:? ;

_output_shapes
: 
!
_user_specified_name	options
®%
í
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6482

inputs6
'assignmovingavg_readvariableop_resource:	8
)assignmovingavg_1_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	0
!batchnorm_readvariableop_resource:	
identity¢AssignMovingAvg¢AssignMovingAvg/ReadVariableOp¢AssignMovingAvg_1¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(e
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(n
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 t
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:y
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:¬
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:´
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:r
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:w
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0q
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿê
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ë
¬
A__inference_dense_3_layer_call_and_return_conditional_losses_4766

inputs2
matmul_readvariableop_resource:

identity¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
IdentityIdentityMatMul:product:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_7_layer_call_and_return_conditional_losses_6305

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¤

ð
<__inference_pi_layer_call_and_return_conditional_losses_6670

inputs2
matmul_readvariableop_resource:
 .
biasadd_readvariableop_resource:	 
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
: *
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ W
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ a
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÏÊ
#
__inference_validate_step_2311
x
pi
vI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
mul_1_x
identity

identity_1

identity_2¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ \
subSubmodel_1/v/Tanh:y:0v*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿJ
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowsub:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       F
MeanMeanpow:z:0Const:output:0*
T0*
_output_shapes
: A
NegNegpi*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [
LogLogmodel_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ O
mulMulNeg:y:0Log:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ X
Const_1Const*
_output_shapes
:*
dtype0*
valueB"       J
Mean_1Meanmul:z:0Const_1:output:0*
T0*
_output_shapes
: G
mul_1Mulmul_1_xMean_1:output:0*
T0*
_output_shapes
: G
addAddV2Mean:output:0	mul_1:z:0*
T0*
_output_shapes
: K
IdentityIdentityMean:output:0^NoOp*
T0*
_output_shapes
: O

Identity_1IdentityMean_1:output:0^NoOp*
T0*
_output_shapes
: G

Identity_2Identityadd:z:0^NoOp*
T0*
_output_shapes
: ®
NoOpNoOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:LH
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:%

_output_shapes
: 
Ê

O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6349

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Æ

"__inference_signature_wrapper_2677
x!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 
identity

identity_1¢StatefulPartitionedCallô
StatefulPartitionedCallStatefulPartitionedCallxunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *!
fR
__inference___call___931p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex
Ú
a
C__inference_dropout_2_layer_call_and_return_conditional_losses_6507

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ß
³
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4544

inputs0
!batchnorm_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	2
#batchnorm_readvariableop_1_resource:	2
#batchnorm_readvariableop_2_resource:	
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOpw
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0s
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:{
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0s
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6281

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
³

 __inference_v_layer_call_fn_6679

inputs
unknown:	
	unknown_0:
identity¢StatefulPartitionedCallÐ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *D
f?R=
;__inference_v_layer_call_and_return_conditional_losses_4804o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Å
_
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

D
(__inference_dropout_2_layer_call_fn_6497

inputs
identity¯
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4757a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ù	
b
C__inference_dropout_2_layer_call_and_return_conditional_losses_4979

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ì
c
G__inference_activation_11_layer_call_and_return_conditional_losses_4784

inputs
identityE
EluEluinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityElu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ù
§
&__inference_model_1_layer_call_fn_5379
input_2!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 
identity

identity_1¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinput_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*8
_read_only_resource_inputs
 !"*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_5231p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
!
_user_specified_name	input_2
Ç

"__inference_signature_wrapper_3014
path!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:
 

unknown_30:	 

unknown_31:	

unknown_32:
identity¢StatefulPartitionedCallÙ
StatefulPartitionedCallStatefulPartitionedCallpathunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: *D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference_save_checkpoint_2469^
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Y
_input_shapesH
F: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:< 8

_output_shapes
: 

_user_specified_namepath
Ôö

 __inference_save_checkpoint_2469
path6
read_readvariableop_resource:,
read_1_readvariableop_resource:,
read_2_readvariableop_resource:,
read_3_readvariableop_resource:,
read_4_readvariableop_resource:8
read_5_readvariableop_resource:,
read_6_readvariableop_resource:,
read_7_readvariableop_resource:,
read_8_readvariableop_resource:,
read_9_readvariableop_resource:9
read_10_readvariableop_resource:-
read_11_readvariableop_resource:-
read_12_readvariableop_resource:-
read_13_readvariableop_resource:-
read_14_readvariableop_resource:9
read_15_readvariableop_resource:-
read_16_readvariableop_resource:-
read_17_readvariableop_resource:-
read_18_readvariableop_resource:-
read_19_readvariableop_resource:3
read_20_readvariableop_resource:
À.
read_21_readvariableop_resource:	.
read_22_readvariableop_resource:	.
read_23_readvariableop_resource:	.
read_24_readvariableop_resource:	3
read_25_readvariableop_resource:
.
read_26_readvariableop_resource:	.
read_27_readvariableop_resource:	.
read_28_readvariableop_resource:	.
read_29_readvariableop_resource:	3
read_30_readvariableop_resource:
 .
read_31_readvariableop_resource:	 2
read_32_readvariableop_resource:	-
read_33_readvariableop_resource:
identity_69¢MergeV2Checkpoints¢Read/ReadVariableOp¢Read_1/ReadVariableOp¢Read_10/ReadVariableOp¢Read_11/ReadVariableOp¢Read_12/ReadVariableOp¢Read_13/ReadVariableOp¢Read_14/ReadVariableOp¢Read_15/ReadVariableOp¢Read_16/ReadVariableOp¢Read_17/ReadVariableOp¢Read_18/ReadVariableOp¢Read_19/ReadVariableOp¢Read_2/ReadVariableOp¢Read_20/ReadVariableOp¢Read_21/ReadVariableOp¢Read_22/ReadVariableOp¢Read_23/ReadVariableOp¢Read_24/ReadVariableOp¢Read_25/ReadVariableOp¢Read_26/ReadVariableOp¢Read_27/ReadVariableOp¢Read_28/ReadVariableOp¢Read_29/ReadVariableOp¢Read_3/ReadVariableOp¢Read_30/ReadVariableOp¢Read_31/ReadVariableOp¢Read_32/ReadVariableOp¢Read_33/ReadVariableOp¢Read_4/ReadVariableOp¢Read_5/ReadVariableOp¢Read_6/ReadVariableOp¢Read_7/ReadVariableOp¢Read_8/ReadVariableOp¢Read_9/ReadVariableOp³*
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*î)
valueä)Bá) BÚ)

	model
root*
º
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
	layer_with_weights-4
	layer-7

layer_with_weights-5

layer-8
layer-9
layer_with_weights-6
layer-10
layer_with_weights-7
layer-11
layer-12
layer-13
layer_with_weights-8
layer-14
layer_with_weights-9
layer-15
layer-16
layer-17
layer_with_weights-10
layer-18
layer_with_weights-11
layer-19
layer-20
layer-21
layer_with_weights-12
layer-22
layer_with_weights-13
layer-23*
* 


kernel*
I
axis
	gamma
beta
moving_mean
moving_variance*
* 


 kernel*
I
!axis
	"gamma
#beta
$moving_mean
%moving_variance*
* 


&kernel*
I
'axis
	(gamma
)beta
*moving_mean
+moving_variance*
* 


,kernel*
I
-axis
	.gamma
/beta
0moving_mean
1moving_variance*
* 
* 


2kernel*
I
3axis
	4gamma
5beta
6moving_mean
7moving_variance*
* 
* 


8kernel*
I
9axis
	:gamma
;beta
<moving_mean
=moving_variance*
* 
* 


>kernel
?bias*


@kernel
Abias*
e_
VARIABLE_VALUEconv2d_4/kernel<model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_6/gamma;model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_6/beta:model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_6/moving_meanAmodel/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_6/moving_varianceEmodel/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_5/kernel<model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_7/gamma;model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_7/beta:model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_7/moving_meanAmodel/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_7/moving_varianceEmodel/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_6/kernel<model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_8/gamma;model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_8/beta:model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_8/moving_meanAmodel/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_8/moving_varianceEmodel/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_7/kernel<model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_9/gamma;model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_9/beta:model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_9/moving_meanAmodel/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_9/moving_varianceEmodel/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEdense_2/kernel<model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
qk
VARIABLE_VALUEbatch_normalization_10/gamma;model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUEbatch_normalization_10/beta:model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE"batch_normalization_10/moving_meanAmodel/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_10/moving_varianceEmodel/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEdense_3/kernel=model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
rl
VARIABLE_VALUEbatch_normalization_11/gamma<model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEbatch_normalization_11/beta;model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE"batch_normalization_11/moving_meanBmodel/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_11/moving_varianceFmodel/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUE	pi/kernel=model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEpi/bias;model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEv/kernel=model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEv/bias;model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUE*p
StaticRegexFullMatchStaticRegexFullMatchpath"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*\
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const_1:output:0Const_2:output:0"/device:CPU:**
T0*
_output_shapes
: _

StringJoin
StringJoinpathSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPHo
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B ²
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Const:output:0"/device:CPU:0*
_output_shapes
 *
dtypes
2
ShardedFilename_1/shardConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
value	B :¶
ShardedFilename_1ShardedFilenameStringJoin:output:0 ShardedFilename_1/shard:output:0num_shards:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: ¦
Read/ReadVariableOpReadVariableOpread_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
IdentityIdentityRead/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:

Identity_1IdentityIdentity:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Read_1/ReadVariableOpReadVariableOpread_1_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_2IdentityRead_1/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_3IdentityIdentity_2:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_2/ReadVariableOpReadVariableOpread_2_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_4IdentityRead_2/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_5IdentityIdentity_4:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_3/ReadVariableOpReadVariableOpread_3_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_6IdentityRead_3/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_7IdentityIdentity_6:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_4/ReadVariableOpReadVariableOpread_4_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_8IdentityRead_4/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_9IdentityIdentity_8:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:ª
Read_5/ReadVariableOpReadVariableOpread_5_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_10IdentityRead_5/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_11IdentityIdentity_10:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Read_6/ReadVariableOpReadVariableOpread_6_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_12IdentityRead_6/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_13IdentityIdentity_12:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_7/ReadVariableOpReadVariableOpread_7_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_14IdentityRead_7/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_15IdentityIdentity_14:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_8/ReadVariableOpReadVariableOpread_8_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_16IdentityRead_8/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_17IdentityIdentity_16:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_9/ReadVariableOpReadVariableOpread_9_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_18IdentityRead_9/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_19IdentityIdentity_18:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¬
Read_10/ReadVariableOpReadVariableOpread_10_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_20IdentityRead_10/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_21IdentityIdentity_20:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
: 
Read_11/ReadVariableOpReadVariableOpread_11_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_22IdentityRead_11/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_23IdentityIdentity_22:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_12/ReadVariableOpReadVariableOpread_12_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_24IdentityRead_12/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_25IdentityIdentity_24:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_13/ReadVariableOpReadVariableOpread_13_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_26IdentityRead_13/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_27IdentityIdentity_26:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_14/ReadVariableOpReadVariableOpread_14_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_28IdentityRead_14/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_29IdentityIdentity_28:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¬
Read_15/ReadVariableOpReadVariableOpread_15_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_30IdentityRead_15/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_31IdentityIdentity_30:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
: 
Read_16/ReadVariableOpReadVariableOpread_16_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_32IdentityRead_16/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_33IdentityIdentity_32:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_17/ReadVariableOpReadVariableOpread_17_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_34IdentityRead_17/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_35IdentityIdentity_34:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_18/ReadVariableOpReadVariableOpread_18_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_36IdentityRead_18/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_37IdentityIdentity_36:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_19/ReadVariableOpReadVariableOpread_19_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_38IdentityRead_19/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_39IdentityIdentity_38:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¦
Read_20/ReadVariableOpReadVariableOpread_20_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
À*
dtype0
Identity_40IdentityRead_20/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
À
Identity_41IdentityIdentity_40:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
À¡
Read_21/ReadVariableOpReadVariableOpread_21_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_42IdentityRead_21/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_43IdentityIdentity_42:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_22/ReadVariableOpReadVariableOpread_22_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_44IdentityRead_22/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_45IdentityIdentity_44:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_23/ReadVariableOpReadVariableOpread_23_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_46IdentityRead_23/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_47IdentityIdentity_46:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_24/ReadVariableOpReadVariableOpread_24_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_48IdentityRead_24/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_49IdentityIdentity_48:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¦
Read_25/ReadVariableOpReadVariableOpread_25_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
*
dtype0
Identity_50IdentityRead_25/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:

Identity_51IdentityIdentity_50:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
¡
Read_26/ReadVariableOpReadVariableOpread_26_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_52IdentityRead_26/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_53IdentityIdentity_52:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_27/ReadVariableOpReadVariableOpread_27_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_54IdentityRead_27/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_55IdentityIdentity_54:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_28/ReadVariableOpReadVariableOpread_28_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_56IdentityRead_28/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_57IdentityIdentity_56:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_29/ReadVariableOpReadVariableOpread_29_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_58IdentityRead_29/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_59IdentityIdentity_58:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¦
Read_30/ReadVariableOpReadVariableOpread_30_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
 *
dtype0
Identity_60IdentityRead_30/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
 
Identity_61IdentityIdentity_60:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
 ¡
Read_31/ReadVariableOpReadVariableOpread_31_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
: *
dtype0
Identity_62IdentityRead_31/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
: 
Identity_63IdentityIdentity_62:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
: ¥
Read_32/ReadVariableOpReadVariableOpread_32_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:	*
dtype0
Identity_64IdentityRead_32/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:	
Identity_65IdentityIdentity_64:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:	 
Read_33/ReadVariableOpReadVariableOpread_33_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_66IdentityRead_33/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_67IdentityIdentity_66:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
SaveV2_1/tensor_namesConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:"*
dtype0*
valueB"B<model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEBBmodel/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBFmodel/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEÒ
SaveV2_1/shape_and_slicesConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Ñ
SaveV2_1SaveV2ShardedFilename_1:filename:0SaveV2_1/tensor_names:output:0"SaveV2_1/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 *0
dtypes&
$2"Ø
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0ShardedFilename_1:filename:0^SaveV2	^SaveV2_1",/job:localhost/replica:0/task:0/device:CPU:0*
N*
T0*
_output_shapes
:£
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0path",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 b
Identity_68Identitypath^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: E
Identity_69Identitypath^NoOp*
T0*
_output_shapes
: ¡
NoOpNoOp^MergeV2Checkpoints^Read/ReadVariableOp^Read_1/ReadVariableOp^Read_10/ReadVariableOp^Read_11/ReadVariableOp^Read_12/ReadVariableOp^Read_13/ReadVariableOp^Read_14/ReadVariableOp^Read_15/ReadVariableOp^Read_16/ReadVariableOp^Read_17/ReadVariableOp^Read_18/ReadVariableOp^Read_19/ReadVariableOp^Read_2/ReadVariableOp^Read_20/ReadVariableOp^Read_21/ReadVariableOp^Read_22/ReadVariableOp^Read_23/ReadVariableOp^Read_24/ReadVariableOp^Read_25/ReadVariableOp^Read_26/ReadVariableOp^Read_27/ReadVariableOp^Read_28/ReadVariableOp^Read_29/ReadVariableOp^Read_3/ReadVariableOp^Read_30/ReadVariableOp^Read_31/ReadVariableOp^Read_32/ReadVariableOp^Read_33/ReadVariableOp^Read_4/ReadVariableOp^Read_5/ReadVariableOp^Read_6/ReadVariableOp^Read_7/ReadVariableOp^Read_8/ReadVariableOp^Read_9/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "#
identity_69Identity_69:output:0*(
_construction_contextkEagerRuntime*Y
_input_shapesH
F: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints2*
Read/ReadVariableOpRead/ReadVariableOp2.
Read_1/ReadVariableOpRead_1/ReadVariableOp20
Read_10/ReadVariableOpRead_10/ReadVariableOp20
Read_11/ReadVariableOpRead_11/ReadVariableOp20
Read_12/ReadVariableOpRead_12/ReadVariableOp20
Read_13/ReadVariableOpRead_13/ReadVariableOp20
Read_14/ReadVariableOpRead_14/ReadVariableOp20
Read_15/ReadVariableOpRead_15/ReadVariableOp20
Read_16/ReadVariableOpRead_16/ReadVariableOp20
Read_17/ReadVariableOpRead_17/ReadVariableOp20
Read_18/ReadVariableOpRead_18/ReadVariableOp20
Read_19/ReadVariableOpRead_19/ReadVariableOp2.
Read_2/ReadVariableOpRead_2/ReadVariableOp20
Read_20/ReadVariableOpRead_20/ReadVariableOp20
Read_21/ReadVariableOpRead_21/ReadVariableOp20
Read_22/ReadVariableOpRead_22/ReadVariableOp20
Read_23/ReadVariableOpRead_23/ReadVariableOp20
Read_24/ReadVariableOpRead_24/ReadVariableOp20
Read_25/ReadVariableOpRead_25/ReadVariableOp20
Read_26/ReadVariableOpRead_26/ReadVariableOp20
Read_27/ReadVariableOpRead_27/ReadVariableOp20
Read_28/ReadVariableOpRead_28/ReadVariableOp20
Read_29/ReadVariableOpRead_29/ReadVariableOp2.
Read_3/ReadVariableOpRead_3/ReadVariableOp20
Read_30/ReadVariableOpRead_30/ReadVariableOp20
Read_31/ReadVariableOpRead_31/ReadVariableOp20
Read_32/ReadVariableOpRead_32/ReadVariableOp20
Read_33/ReadVariableOpRead_33/ReadVariableOp2.
Read_4/ReadVariableOpRead_4/ReadVariableOp2.
Read_5/ReadVariableOpRead_5/ReadVariableOp2.
Read_6/ReadVariableOpRead_6/ReadVariableOp2.
Read_7/ReadVariableOpRead_7/ReadVariableOp2.
Read_8/ReadVariableOpRead_8/ReadVariableOp2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:< 8

_output_shapes
: 

_user_specified_namepath
	
Ï
4__inference_batch_normalization_7_layer_call_fn_6159

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4299
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ë
¬
A__inference_dense_2_layer_call_and_return_conditional_losses_4732

inputs2
matmul_readvariableop_resource:
À
identity¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
IdentityIdentityMatMul:product:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿÀ: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
 
_user_specified_nameinputs
¬
Ô
5__inference_batch_normalization_10_layer_call_fn_6428

inputs
unknown:	
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity¢StatefulPartitionedCallþ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4509p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ë
¬
A__inference_dense_3_layer_call_and_return_conditional_losses_6533

inputs2
matmul_readvariableop_resource:

identity¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
IdentityIdentityMatMul:product:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4396

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

§
&__inference_model_1_layer_call_fn_4902
input_2!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 
identity

identity_1¢StatefulPartitionedCall£
StatefulPartitionedCallStatefulPartitionedCallinput_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_4829p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
!
_user_specified_name	input_2
Ôö

 __inference_save_checkpoint_3533
path6
read_readvariableop_resource:,
read_1_readvariableop_resource:,
read_2_readvariableop_resource:,
read_3_readvariableop_resource:,
read_4_readvariableop_resource:8
read_5_readvariableop_resource:,
read_6_readvariableop_resource:,
read_7_readvariableop_resource:,
read_8_readvariableop_resource:,
read_9_readvariableop_resource:9
read_10_readvariableop_resource:-
read_11_readvariableop_resource:-
read_12_readvariableop_resource:-
read_13_readvariableop_resource:-
read_14_readvariableop_resource:9
read_15_readvariableop_resource:-
read_16_readvariableop_resource:-
read_17_readvariableop_resource:-
read_18_readvariableop_resource:-
read_19_readvariableop_resource:3
read_20_readvariableop_resource:
À.
read_21_readvariableop_resource:	.
read_22_readvariableop_resource:	.
read_23_readvariableop_resource:	.
read_24_readvariableop_resource:	3
read_25_readvariableop_resource:
.
read_26_readvariableop_resource:	.
read_27_readvariableop_resource:	.
read_28_readvariableop_resource:	.
read_29_readvariableop_resource:	3
read_30_readvariableop_resource:
 .
read_31_readvariableop_resource:	 2
read_32_readvariableop_resource:	-
read_33_readvariableop_resource:
identity_69¢MergeV2Checkpoints¢Read/ReadVariableOp¢Read_1/ReadVariableOp¢Read_10/ReadVariableOp¢Read_11/ReadVariableOp¢Read_12/ReadVariableOp¢Read_13/ReadVariableOp¢Read_14/ReadVariableOp¢Read_15/ReadVariableOp¢Read_16/ReadVariableOp¢Read_17/ReadVariableOp¢Read_18/ReadVariableOp¢Read_19/ReadVariableOp¢Read_2/ReadVariableOp¢Read_20/ReadVariableOp¢Read_21/ReadVariableOp¢Read_22/ReadVariableOp¢Read_23/ReadVariableOp¢Read_24/ReadVariableOp¢Read_25/ReadVariableOp¢Read_26/ReadVariableOp¢Read_27/ReadVariableOp¢Read_28/ReadVariableOp¢Read_29/ReadVariableOp¢Read_3/ReadVariableOp¢Read_30/ReadVariableOp¢Read_31/ReadVariableOp¢Read_32/ReadVariableOp¢Read_33/ReadVariableOp¢Read_4/ReadVariableOp¢Read_5/ReadVariableOp¢Read_6/ReadVariableOp¢Read_7/ReadVariableOp¢Read_8/ReadVariableOp¢Read_9/ReadVariableOp³*
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*î)
valueä)Bá) BÚ)

	model
root*
º
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
	layer_with_weights-4
	layer-7

layer_with_weights-5

layer-8
layer-9
layer_with_weights-6
layer-10
layer_with_weights-7
layer-11
layer-12
layer-13
layer_with_weights-8
layer-14
layer_with_weights-9
layer-15
layer-16
layer-17
layer_with_weights-10
layer-18
layer_with_weights-11
layer-19
layer-20
layer-21
layer_with_weights-12
layer-22
layer_with_weights-13
layer-23*
* 


kernel*
I
axis
	gamma
beta
moving_mean
moving_variance*
* 


 kernel*
I
!axis
	"gamma
#beta
$moving_mean
%moving_variance*
* 


&kernel*
I
'axis
	(gamma
)beta
*moving_mean
+moving_variance*
* 


,kernel*
I
-axis
	.gamma
/beta
0moving_mean
1moving_variance*
* 
* 


2kernel*
I
3axis
	4gamma
5beta
6moving_mean
7moving_variance*
* 
* 


8kernel*
I
9axis
	:gamma
;beta
<moving_mean
=moving_variance*
* 
* 


>kernel
?bias*


@kernel
Abias*
e_
VARIABLE_VALUEconv2d_4/kernel<model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_6/gamma;model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_6/beta:model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_6/moving_meanAmodel/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_6/moving_varianceEmodel/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_5/kernel<model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_7/gamma;model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_7/beta:model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_7/moving_meanAmodel/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_7/moving_varianceEmodel/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_6/kernel<model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_8/gamma;model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_8/beta:model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_8/moving_meanAmodel/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_8/moving_varianceEmodel/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_7/kernel<model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
pj
VARIABLE_VALUEbatch_normalization_9/gamma;model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEbatch_normalization_9/beta:model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE!batch_normalization_9/moving_meanAmodel/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE%batch_normalization_9/moving_varianceEmodel/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEdense_2/kernel<model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
qk
VARIABLE_VALUEbatch_normalization_10/gamma;model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUEbatch_normalization_10/beta:model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE"batch_normalization_10/moving_meanAmodel/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_10/moving_varianceEmodel/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEdense_3/kernel=model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
rl
VARIABLE_VALUEbatch_normalization_11/gamma<model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEbatch_normalization_11/beta;model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE"batch_normalization_11/moving_meanBmodel/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE&batch_normalization_11/moving_varianceFmodel/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUE	pi/kernel=model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEpi/bias;model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEv/kernel=model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEv/bias;model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUE*p
StaticRegexFullMatchStaticRegexFullMatchpath"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*\
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const_1:output:0Const_2:output:0"/device:CPU:**
T0*
_output_shapes
: _

StringJoin
StringJoinpathSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPHo
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B ²
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Const:output:0"/device:CPU:0*
_output_shapes
 *
dtypes
2
ShardedFilename_1/shardConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
value	B :¶
ShardedFilename_1ShardedFilenameStringJoin:output:0 ShardedFilename_1/shard:output:0num_shards:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: ¦
Read/ReadVariableOpReadVariableOpread_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
IdentityIdentityRead/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:

Identity_1IdentityIdentity:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Read_1/ReadVariableOpReadVariableOpread_1_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_2IdentityRead_1/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_3IdentityIdentity_2:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_2/ReadVariableOpReadVariableOpread_2_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_4IdentityRead_2/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_5IdentityIdentity_4:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_3/ReadVariableOpReadVariableOpread_3_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_6IdentityRead_3/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_7IdentityIdentity_6:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_4/ReadVariableOpReadVariableOpread_4_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0

Identity_8IdentityRead_4/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:~

Identity_9IdentityIdentity_8:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:ª
Read_5/ReadVariableOpReadVariableOpread_5_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_10IdentityRead_5/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_11IdentityIdentity_10:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Read_6/ReadVariableOpReadVariableOpread_6_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_12IdentityRead_6/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_13IdentityIdentity_12:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_7/ReadVariableOpReadVariableOpread_7_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_14IdentityRead_7/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_15IdentityIdentity_14:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_8/ReadVariableOpReadVariableOpread_8_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_16IdentityRead_8/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_17IdentityIdentity_16:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Read_9/ReadVariableOpReadVariableOpread_9_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_18IdentityRead_9/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_19IdentityIdentity_18:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¬
Read_10/ReadVariableOpReadVariableOpread_10_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_20IdentityRead_10/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_21IdentityIdentity_20:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
: 
Read_11/ReadVariableOpReadVariableOpread_11_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_22IdentityRead_11/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_23IdentityIdentity_22:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_12/ReadVariableOpReadVariableOpread_12_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_24IdentityRead_12/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_25IdentityIdentity_24:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_13/ReadVariableOpReadVariableOpread_13_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_26IdentityRead_13/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_27IdentityIdentity_26:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_14/ReadVariableOpReadVariableOpread_14_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_28IdentityRead_14/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_29IdentityIdentity_28:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¬
Read_15/ReadVariableOpReadVariableOpread_15_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*&
_output_shapes
:*
dtype0
Identity_30IdentityRead_15/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
:
Identity_31IdentityIdentity_30:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*&
_output_shapes
: 
Read_16/ReadVariableOpReadVariableOpread_16_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_32IdentityRead_16/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_33IdentityIdentity_32:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_17/ReadVariableOpReadVariableOpread_17_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_34IdentityRead_17/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_35IdentityIdentity_34:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_18/ReadVariableOpReadVariableOpread_18_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_36IdentityRead_18/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_37IdentityIdentity_36:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Read_19/ReadVariableOpReadVariableOpread_19_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_38IdentityRead_19/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_39IdentityIdentity_38:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:¦
Read_20/ReadVariableOpReadVariableOpread_20_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
À*
dtype0
Identity_40IdentityRead_20/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
À
Identity_41IdentityIdentity_40:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
À¡
Read_21/ReadVariableOpReadVariableOpread_21_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_42IdentityRead_21/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_43IdentityIdentity_42:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_22/ReadVariableOpReadVariableOpread_22_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_44IdentityRead_22/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_45IdentityIdentity_44:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_23/ReadVariableOpReadVariableOpread_23_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_46IdentityRead_23/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_47IdentityIdentity_46:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_24/ReadVariableOpReadVariableOpread_24_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_48IdentityRead_24/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_49IdentityIdentity_48:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¦
Read_25/ReadVariableOpReadVariableOpread_25_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
*
dtype0
Identity_50IdentityRead_25/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:

Identity_51IdentityIdentity_50:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
¡
Read_26/ReadVariableOpReadVariableOpread_26_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_52IdentityRead_26/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_53IdentityIdentity_52:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_27/ReadVariableOpReadVariableOpread_27_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_54IdentityRead_27/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_55IdentityIdentity_54:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_28/ReadVariableOpReadVariableOpread_28_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_56IdentityRead_28/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_57IdentityIdentity_56:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¡
Read_29/ReadVariableOpReadVariableOpread_29_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
:*
dtype0
Identity_58IdentityRead_29/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:
Identity_59IdentityIdentity_58:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
:¦
Read_30/ReadVariableOpReadVariableOpread_30_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0* 
_output_shapes
:
 *
dtype0
Identity_60IdentityRead_30/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
 
Identity_61IdentityIdentity_60:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0* 
_output_shapes
:
 ¡
Read_31/ReadVariableOpReadVariableOpread_31_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes	
: *
dtype0
Identity_62IdentityRead_31/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
: 
Identity_63IdentityIdentity_62:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes	
: ¥
Read_32/ReadVariableOpReadVariableOpread_32_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:	*
dtype0
Identity_64IdentityRead_32/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:	
Identity_65IdentityIdentity_64:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:	 
Read_33/ReadVariableOpReadVariableOpread_33_readvariableop_resource",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:*
dtype0
Identity_66IdentityRead_33/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
Identity_67IdentityIdentity_66:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
:
SaveV2_1/tensor_namesConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:"*
dtype0*
valueB"B<model/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB:model/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEBAmodel/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBEmodel/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB<model/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEBBmodel/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBFmodel/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEB=model/layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEB;model/layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEÒ
SaveV2_1/shape_and_slicesConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Ñ
SaveV2_1SaveV2ShardedFilename_1:filename:0SaveV2_1/tensor_names:output:0"SaveV2_1/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 *0
dtypes&
$2"Ø
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0ShardedFilename_1:filename:0^SaveV2	^SaveV2_1",/job:localhost/replica:0/task:0/device:CPU:0*
N*
T0*
_output_shapes
:£
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0path",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 b
Identity_68Identitypath^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: E
Identity_69Identitypath^NoOp*
T0*
_output_shapes
: ¡
NoOpNoOp^MergeV2Checkpoints^Read/ReadVariableOp^Read_1/ReadVariableOp^Read_10/ReadVariableOp^Read_11/ReadVariableOp^Read_12/ReadVariableOp^Read_13/ReadVariableOp^Read_14/ReadVariableOp^Read_15/ReadVariableOp^Read_16/ReadVariableOp^Read_17/ReadVariableOp^Read_18/ReadVariableOp^Read_19/ReadVariableOp^Read_2/ReadVariableOp^Read_20/ReadVariableOp^Read_21/ReadVariableOp^Read_22/ReadVariableOp^Read_23/ReadVariableOp^Read_24/ReadVariableOp^Read_25/ReadVariableOp^Read_26/ReadVariableOp^Read_27/ReadVariableOp^Read_28/ReadVariableOp^Read_29/ReadVariableOp^Read_3/ReadVariableOp^Read_30/ReadVariableOp^Read_31/ReadVariableOp^Read_32/ReadVariableOp^Read_33/ReadVariableOp^Read_4/ReadVariableOp^Read_5/ReadVariableOp^Read_6/ReadVariableOp^Read_7/ReadVariableOp^Read_8/ReadVariableOp^Read_9/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "#
identity_69Identity_69:output:0*(
_construction_contextkEagerRuntime*Y
_input_shapesH
F: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints2*
Read/ReadVariableOpRead/ReadVariableOp2.
Read_1/ReadVariableOpRead_1/ReadVariableOp20
Read_10/ReadVariableOpRead_10/ReadVariableOp20
Read_11/ReadVariableOpRead_11/ReadVariableOp20
Read_12/ReadVariableOpRead_12/ReadVariableOp20
Read_13/ReadVariableOpRead_13/ReadVariableOp20
Read_14/ReadVariableOpRead_14/ReadVariableOp20
Read_15/ReadVariableOpRead_15/ReadVariableOp20
Read_16/ReadVariableOpRead_16/ReadVariableOp20
Read_17/ReadVariableOpRead_17/ReadVariableOp20
Read_18/ReadVariableOpRead_18/ReadVariableOp20
Read_19/ReadVariableOpRead_19/ReadVariableOp2.
Read_2/ReadVariableOpRead_2/ReadVariableOp20
Read_20/ReadVariableOpRead_20/ReadVariableOp20
Read_21/ReadVariableOpRead_21/ReadVariableOp20
Read_22/ReadVariableOpRead_22/ReadVariableOp20
Read_23/ReadVariableOpRead_23/ReadVariableOp20
Read_24/ReadVariableOpRead_24/ReadVariableOp20
Read_25/ReadVariableOpRead_25/ReadVariableOp20
Read_26/ReadVariableOpRead_26/ReadVariableOp20
Read_27/ReadVariableOpRead_27/ReadVariableOp20
Read_28/ReadVariableOpRead_28/ReadVariableOp20
Read_29/ReadVariableOpRead_29/ReadVariableOp2.
Read_3/ReadVariableOpRead_3/ReadVariableOp20
Read_30/ReadVariableOpRead_30/ReadVariableOp20
Read_31/ReadVariableOpRead_31/ReadVariableOp20
Read_32/ReadVariableOpRead_32/ReadVariableOp20
Read_33/ReadVariableOpRead_33/ReadVariableOp2.
Read_4/ReadVariableOpRead_4/ReadVariableOp2.
Read_5/ReadVariableOpRead_5/ReadVariableOp2.
Read_6/ReadVariableOpRead_6/ReadVariableOp2.
Read_7/ReadVariableOpRead_7/ReadVariableOp2.
Read_8/ReadVariableOpRead_8/ReadVariableOp2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:< 8

_output_shapes
: 

_user_specified_namepath
Ì
c
G__inference_activation_10_layer_call_and_return_conditional_losses_4750

inputs
identityE
EluEluinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityElu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6177

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_8_layer_call_fn_6232

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4332
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

¦
&__inference_model_1_layer_call_fn_5646

inputs!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 
identity

identity_1¢StatefulPartitionedCall¢
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*D
_read_only_resource_inputs&
$"	
 !"*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_4829p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
G
+__inference_activation_6_layer_call_fn_6114

inputs
identity¹
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_6_layer_call_and_return_conditional_losses_4634h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
­
D
(__inference_flatten_1_layer_call_fn_6382

inputs
identity¯
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
G
+__inference_activation_7_layer_call_fn_6200

inputs
identity¹
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_7_layer_call_and_return_conditional_losses_4661h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ñ
a
(__inference_dropout_2_layer_call_fn_6502

inputs
identity¢StatefulPartitionedCall¿
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4979p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
§
H
,__inference_activation_11_layer_call_fn_6618

inputs
identity³
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_11_layer_call_and_return_conditional_losses_4784a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ß
³
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6448

inputs0
!batchnorm_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	2
#batchnorm_readvariableop_1_resource:	2
#batchnorm_readvariableop_2_resource:	
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOpw
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0s
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:{
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0s
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
®
Ô
5__inference_batch_normalization_10_layer_call_fn_6415

inputs
unknown:	
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4462p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_7_layer_call_fn_6146

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4268
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_6_layer_call_and_return_conditional_losses_6219

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¾

'__inference_conv2d_4_layer_call_fn_6040

inputs!
unknown:
identity¢StatefulPartitionedCallÒ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ß
³
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6579

inputs0
!batchnorm_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	2
#batchnorm_readvariableop_1_resource:	2
#batchnorm_readvariableop_2_resource:	
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOpw
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0s
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:{
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0s
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_9_layer_call_fn_6318

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4396
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
·À
Î"
__inference___call___931
xI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
identity

identity_1¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ l
IdentityIdentitymodel_1/pi/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ c

Identity_1Identitymodel_1/v/Tanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
NoOpNoOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex
¸À
Ï"
__inference___call___3246
xI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
identity

identity_1¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ l
IdentityIdentitymodel_1/pi/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ c

Identity_1Identitymodel_1/v/Tanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
NoOpNoOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex
Ê

O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4204

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs


í
;__inference_v_layer_call_and_return_conditional_losses_4804

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ñ&
´
"__inference_signature_wrapper_2856
pi
v
x!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 

unknown_33

unknown_34: 

unknown_35:	 

unknown_36: 

unknown_37: $

unknown_38:$

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:$

unknown_44:$

unknown_45:

unknown_46:

unknown_47:

unknown_48:

unknown_49:$

unknown_50:$

unknown_51:

unknown_52:

unknown_53:

unknown_54:

unknown_55:$

unknown_56:$

unknown_57:

unknown_58:

unknown_59:

unknown_60:

unknown_61:

unknown_62:
À

unknown_63:
À

unknown_64:	

unknown_65:	

unknown_66:	

unknown_67:	

unknown_68:


unknown_69:


unknown_70:	

unknown_71:	

unknown_72:	

unknown_73:	

unknown_74:
 

unknown_75:
 

unknown_76:	 

unknown_77:	 

unknown_78:	

unknown_79:	

unknown_80:

unknown_81:
identity

identity_1

identity_2¢StatefulPartitionedCallÊ

StatefulPartitionedCallStatefulPartitionedCallxpivunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65
unknown_66
unknown_67
unknown_68
unknown_69
unknown_70
unknown_71
unknown_72
unknown_73
unknown_74
unknown_75
unknown_76
unknown_77
unknown_78
unknown_79
unknown_80
unknown_81*a
TinZ
X2V*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: : : *1
_read_only_resource_inputs
&()*-
config_proto

CPU

GPU 2J 8 *$
fR
__inference_train_step_2159^
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: `

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*ù
_input_shapesç
ä:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:L H
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:RN
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:%

_output_shapes
: 
¤

ð
<__inference_pi_layer_call_and_return_conditional_losses_4821

inputs2
matmul_readvariableop_resource:
 .
biasadd_readvariableop_resource:	 
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
: *
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ W
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ a
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÏV
«

!__inference_internal_grad_fn_7152
result_grads_0
result_grads_1
result_grads_2
result_grads_3
result_grads_4
result_grads_5
result_grads_6
result_grads_7
result_grads_8
result_grads_9
result_grads_10
result_grads_11
result_grads_12
result_grads_13
result_grads_14
result_grads_15
result_grads_16
result_grads_17
result_grads_18
result_grads_19
result_grads_20
result_grads_21
result_grads_22
result_grads_23
result_grads_24
result_grads_25
result_grads_26
result_grads_27
result_grads_28
result_grads_29
result_grads_30
result_grads_31
result_grads_32
result_grads_33
result_grads_34
result_grads_35
result_grads_36
result_grads_37
result_grads_38
result_grads_39
result_grads_40
result_grads_41
result_grads_42
result_grads_43
identity_22
identity_23
identity_24
identity_25
identity_26
identity_27
identity_28
identity_29
identity_30
identity_31
identity_32
identity_33
identity_34
identity_35
identity_36
identity_37
identity_38
identity_39
identity_40
identity_41
identity_42
identity_43U
IdentityIdentityresult_grads_0*
T0*&
_output_shapes
:K

Identity_1Identityresult_grads_1*
T0*
_output_shapes
:K

Identity_2Identityresult_grads_2*
T0*
_output_shapes
:W

Identity_3Identityresult_grads_3*
T0*&
_output_shapes
:K

Identity_4Identityresult_grads_4*
T0*
_output_shapes
:K

Identity_5Identityresult_grads_5*
T0*
_output_shapes
:W

Identity_6Identityresult_grads_6*
T0*&
_output_shapes
:K

Identity_7Identityresult_grads_7*
T0*
_output_shapes
:K

Identity_8Identityresult_grads_8*
T0*
_output_shapes
:W

Identity_9Identityresult_grads_9*
T0*&
_output_shapes
:M
Identity_10Identityresult_grads_10*
T0*
_output_shapes
:M
Identity_11Identityresult_grads_11*
T0*
_output_shapes
:S
Identity_12Identityresult_grads_12*
T0* 
_output_shapes
:
ÀN
Identity_13Identityresult_grads_13*
T0*
_output_shapes	
:N
Identity_14Identityresult_grads_14*
T0*
_output_shapes	
:S
Identity_15Identityresult_grads_15*
T0* 
_output_shapes
:
N
Identity_16Identityresult_grads_16*
T0*
_output_shapes	
:N
Identity_17Identityresult_grads_17*
T0*
_output_shapes	
:S
Identity_18Identityresult_grads_18*
T0* 
_output_shapes
:
 N
Identity_19Identityresult_grads_19*
T0*
_output_shapes	
: R
Identity_20Identityresult_grads_20*
T0*
_output_shapes
:	M
Identity_21Identityresult_grads_21*
T0*
_output_shapes
:

	IdentityN	IdentityNresult_grads_0result_grads_1result_grads_2result_grads_3result_grads_4result_grads_5result_grads_6result_grads_7result_grads_8result_grads_9result_grads_10result_grads_11result_grads_12result_grads_13result_grads_14result_grads_15result_grads_16result_grads_17result_grads_18result_grads_19result_grads_20result_grads_21result_grads_0result_grads_1result_grads_2result_grads_3result_grads_4result_grads_5result_grads_6result_grads_7result_grads_8result_grads_9result_grads_10result_grads_11result_grads_12result_grads_13result_grads_14result_grads_15result_grads_16result_grads_17result_grads_18result_grads_19result_grads_20result_grads_21*5
T0
.2,**
_gradient_op_typeCustomGradient-7063*¶
_output_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	:\
Identity_22IdentityIdentityN:output:0*
T0*&
_output_shapes
:P
Identity_23IdentityIdentityN:output:1*
T0*
_output_shapes
:P
Identity_24IdentityIdentityN:output:2*
T0*
_output_shapes
:\
Identity_25IdentityIdentityN:output:3*
T0*&
_output_shapes
:P
Identity_26IdentityIdentityN:output:4*
T0*
_output_shapes
:P
Identity_27IdentityIdentityN:output:5*
T0*
_output_shapes
:\
Identity_28IdentityIdentityN:output:6*
T0*&
_output_shapes
:P
Identity_29IdentityIdentityN:output:7*
T0*
_output_shapes
:P
Identity_30IdentityIdentityN:output:8*
T0*
_output_shapes
:\
Identity_31IdentityIdentityN:output:9*
T0*&
_output_shapes
:Q
Identity_32IdentityIdentityN:output:10*
T0*
_output_shapes
:Q
Identity_33IdentityIdentityN:output:11*
T0*
_output_shapes
:W
Identity_34IdentityIdentityN:output:12*
T0* 
_output_shapes
:
ÀR
Identity_35IdentityIdentityN:output:13*
T0*
_output_shapes	
:R
Identity_36IdentityIdentityN:output:14*
T0*
_output_shapes	
:W
Identity_37IdentityIdentityN:output:15*
T0* 
_output_shapes
:
R
Identity_38IdentityIdentityN:output:16*
T0*
_output_shapes	
:R
Identity_39IdentityIdentityN:output:17*
T0*
_output_shapes	
:W
Identity_40IdentityIdentityN:output:18*
T0* 
_output_shapes
:
 R
Identity_41IdentityIdentityN:output:19*
T0*
_output_shapes	
: V
Identity_42IdentityIdentityN:output:20*
T0*
_output_shapes
:	Q
Identity_43IdentityIdentityN:output:21*
T0*
_output_shapes
:"#
identity_22Identity_22:output:0"#
identity_23Identity_23:output:0"#
identity_24Identity_24:output:0"#
identity_25Identity_25:output:0"#
identity_26Identity_26:output:0"#
identity_27Identity_27:output:0"#
identity_28Identity_28:output:0"#
identity_29Identity_29:output:0"#
identity_30Identity_30:output:0"#
identity_31Identity_31:output:0"#
identity_32Identity_32:output:0"#
identity_33Identity_33:output:0"#
identity_34Identity_34:output:0"#
identity_35Identity_35:output:0"#
identity_36Identity_36:output:0"#
identity_37Identity_37:output:0"#
identity_38Identity_38:output:0"#
identity_39Identity_39:output:0"#
identity_40Identity_40:output:0"#
identity_41Identity_41:output:0"#
identity_42Identity_42:output:0"#
identity_43Identity_43:output:0*µ
_input_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	::V R
&
_output_shapes
:
(
_user_specified_nameresult_grads_0:JF

_output_shapes
:
(
_user_specified_nameresult_grads_1:JF

_output_shapes
:
(
_user_specified_nameresult_grads_2:VR
&
_output_shapes
:
(
_user_specified_nameresult_grads_3:JF

_output_shapes
:
(
_user_specified_nameresult_grads_4:JF

_output_shapes
:
(
_user_specified_nameresult_grads_5:VR
&
_output_shapes
:
(
_user_specified_nameresult_grads_6:JF

_output_shapes
:
(
_user_specified_nameresult_grads_7:JF

_output_shapes
:
(
_user_specified_nameresult_grads_8:V	R
&
_output_shapes
:
(
_user_specified_nameresult_grads_9:K
G

_output_shapes
:
)
_user_specified_nameresult_grads_10:KG

_output_shapes
:
)
_user_specified_nameresult_grads_11:QM
 
_output_shapes
:
À
)
_user_specified_nameresult_grads_12:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_13:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_14:QM
 
_output_shapes
:

)
_user_specified_nameresult_grads_15:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_16:LH

_output_shapes	
:
)
_user_specified_nameresult_grads_17:QM
 
_output_shapes
:
 
)
_user_specified_nameresult_grads_18:LH

_output_shapes	
: 
)
_user_specified_nameresult_grads_19:PL

_output_shapes
:	
)
_user_specified_nameresult_grads_20:KG

_output_shapes
:
)
_user_specified_nameresult_grads_21:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_22:KG

_output_shapes
:
)
_user_specified_nameresult_grads_23:KG

_output_shapes
:
)
_user_specified_nameresult_grads_24:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_25:KG

_output_shapes
:
)
_user_specified_nameresult_grads_26:KG

_output_shapes
:
)
_user_specified_nameresult_grads_27:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_28:KG

_output_shapes
:
)
_user_specified_nameresult_grads_29:KG

_output_shapes
:
)
_user_specified_nameresult_grads_30:WS
&
_output_shapes
:
)
_user_specified_nameresult_grads_31:K G

_output_shapes
:
)
_user_specified_nameresult_grads_32:K!G

_output_shapes
:
)
_user_specified_nameresult_grads_33:Q"M
 
_output_shapes
:
À
)
_user_specified_nameresult_grads_34:L#H

_output_shapes	
:
)
_user_specified_nameresult_grads_35:L$H

_output_shapes	
:
)
_user_specified_nameresult_grads_36:Q%M
 
_output_shapes
:

)
_user_specified_nameresult_grads_37:L&H

_output_shapes	
:
)
_user_specified_nameresult_grads_38:L'H

_output_shapes	
:
)
_user_specified_nameresult_grads_39:Q(M
 
_output_shapes
:
 
)
_user_specified_nameresult_grads_40:L)H

_output_shapes	
: 
)
_user_specified_nameresult_grads_41:P*L

_output_shapes
:	
)
_user_specified_nameresult_grads_42:K+G

_output_shapes
:
)
_user_specified_nameresult_grads_43
µ
@
__inference_train_step_2159
x
pi
vI
/model_1_conv2d_4_conv2d_readvariableop_resource:C
5model_1_batch_normalization_6_readvariableop_resource:E
7model_1_batch_normalization_6_readvariableop_1_resource:T
Fmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_5_conv2d_readvariableop_resource:C
5model_1_batch_normalization_7_readvariableop_resource:E
7model_1_batch_normalization_7_readvariableop_1_resource:T
Fmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_6_conv2d_readvariableop_resource:C
5model_1_batch_normalization_8_readvariableop_resource:E
7model_1_batch_normalization_8_readvariableop_1_resource:T
Fmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:I
/model_1_conv2d_7_conv2d_readvariableop_resource:C
5model_1_batch_normalization_9_readvariableop_resource:E
7model_1_batch_normalization_9_readvariableop_1_resource:T
Fmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource:B
.model_1_dense_2_matmul_readvariableop_resource:
ÀO
@model_1_batch_normalization_10_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource:	B
.model_1_dense_3_matmul_readvariableop_resource:
O
@model_1_batch_normalization_11_batchnorm_readvariableop_resource:	S
Dmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource:	Q
Bmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource:	;
(model_1_v_matmul_readvariableop_resource:	7
)model_1_v_biasadd_readvariableop_resource:=
)model_1_pi_matmul_readvariableop_resource:
 9
*model_1_pi_biasadd_readvariableop_resource:	 
mul_1_x+
!adam_cast_readvariableop_resource: &
adam_readvariableop_resource:	 -
#adam_cast_2_readvariableop_resource: -
#adam_cast_3_readvariableop_resource: >
$adam_adam_update_resourceapplyadam_m:>
$adam_adam_update_resourceapplyadam_v:4
&adam_adam_update_1_resourceapplyadam_m:4
&adam_adam_update_1_resourceapplyadam_v:4
&adam_adam_update_2_resourceapplyadam_m:4
&adam_adam_update_2_resourceapplyadam_v:@
&adam_adam_update_3_resourceapplyadam_m:@
&adam_adam_update_3_resourceapplyadam_v:4
&adam_adam_update_4_resourceapplyadam_m:4
&adam_adam_update_4_resourceapplyadam_v:4
&adam_adam_update_5_resourceapplyadam_m:4
&adam_adam_update_5_resourceapplyadam_v:@
&adam_adam_update_6_resourceapplyadam_m:@
&adam_adam_update_6_resourceapplyadam_v:4
&adam_adam_update_7_resourceapplyadam_m:4
&adam_adam_update_7_resourceapplyadam_v:4
&adam_adam_update_8_resourceapplyadam_m:4
&adam_adam_update_8_resourceapplyadam_v:@
&adam_adam_update_9_resourceapplyadam_m:@
&adam_adam_update_9_resourceapplyadam_v:5
'adam_adam_update_10_resourceapplyadam_m:5
'adam_adam_update_10_resourceapplyadam_v:5
'adam_adam_update_11_resourceapplyadam_m:5
'adam_adam_update_11_resourceapplyadam_v:;
'adam_adam_update_12_resourceapplyadam_m:
À;
'adam_adam_update_12_resourceapplyadam_v:
À6
'adam_adam_update_13_resourceapplyadam_m:	6
'adam_adam_update_13_resourceapplyadam_v:	6
'adam_adam_update_14_resourceapplyadam_m:	6
'adam_adam_update_14_resourceapplyadam_v:	;
'adam_adam_update_15_resourceapplyadam_m:
;
'adam_adam_update_15_resourceapplyadam_v:
6
'adam_adam_update_16_resourceapplyadam_m:	6
'adam_adam_update_16_resourceapplyadam_v:	6
'adam_adam_update_17_resourceapplyadam_m:	6
'adam_adam_update_17_resourceapplyadam_v:	;
'adam_adam_update_18_resourceapplyadam_m:
 ;
'adam_adam_update_18_resourceapplyadam_v:
 6
'adam_adam_update_19_resourceapplyadam_m:	 6
'adam_adam_update_19_resourceapplyadam_v:	 :
'adam_adam_update_20_resourceapplyadam_m:	:
'adam_adam_update_20_resourceapplyadam_v:	5
'adam_adam_update_21_resourceapplyadam_m:5
'adam_adam_update_21_resourceapplyadam_v:
identity

identity_1

identity_2¢Adam/Adam/AssignAddVariableOp¢"Adam/Adam/update/ResourceApplyAdam¢$Adam/Adam/update_1/ResourceApplyAdam¢%Adam/Adam/update_10/ResourceApplyAdam¢%Adam/Adam/update_11/ResourceApplyAdam¢%Adam/Adam/update_12/ResourceApplyAdam¢%Adam/Adam/update_13/ResourceApplyAdam¢%Adam/Adam/update_14/ResourceApplyAdam¢%Adam/Adam/update_15/ResourceApplyAdam¢%Adam/Adam/update_16/ResourceApplyAdam¢%Adam/Adam/update_17/ResourceApplyAdam¢%Adam/Adam/update_18/ResourceApplyAdam¢%Adam/Adam/update_19/ResourceApplyAdam¢$Adam/Adam/update_2/ResourceApplyAdam¢%Adam/Adam/update_20/ResourceApplyAdam¢%Adam/Adam/update_21/ResourceApplyAdam¢$Adam/Adam/update_3/ResourceApplyAdam¢$Adam/Adam/update_4/ResourceApplyAdam¢$Adam/Adam/update_5/ResourceApplyAdam¢$Adam/Adam/update_6/ResourceApplyAdam¢$Adam/Adam/update_7/ResourceApplyAdam¢$Adam/Adam/update_8/ResourceApplyAdam¢$Adam/Adam/update_9/ResourceApplyAdam¢Adam/Cast/ReadVariableOp¢Adam/Cast_2/ReadVariableOp¢Adam/Cast_3/ReadVariableOp¢Adam/ReadVariableOp¢7model_1/batch_normalization_10/batchnorm/ReadVariableOp¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp¢7model_1/batch_normalization_11/batchnorm/ReadVariableOp¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1¢9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2¢;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp¢=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_6/ReadVariableOp¢.model_1/batch_normalization_6/ReadVariableOp_1¢=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_7/ReadVariableOp¢.model_1/batch_normalization_7/ReadVariableOp_1¢=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_8/ReadVariableOp¢.model_1/batch_normalization_8/ReadVariableOp_1¢=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢,model_1/batch_normalization_9/ReadVariableOp¢.model_1/batch_normalization_9/ReadVariableOp_1¢&model_1/conv2d_4/Conv2D/ReadVariableOp¢&model_1/conv2d_5/Conv2D/ReadVariableOp¢&model_1/conv2d_6/Conv2D/ReadVariableOp¢&model_1/conv2d_7/Conv2D/ReadVariableOp¢%model_1/dense_2/MatMul/ReadVariableOp¢%model_1/dense_3/MatMul/ReadVariableOp¢!model_1/pi/BiasAdd/ReadVariableOp¢ model_1/pi/MatMul/ReadVariableOp¢ model_1/v/BiasAdd/ReadVariableOp¢model_1/v/MatMul/ReadVariableOp
&model_1/conv2d_4/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¶
model_1/conv2d_4/Conv2DConv2Dx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_6/ReadVariableOpReadVariableOp5model_1_batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_6/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_6/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:06model_1/batch_normalization_6/ReadVariableOp_1:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_6/EluElu2model_1/batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_5/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Û
model_1/conv2d_5/Conv2DConv2D&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

,model_1/batch_normalization_7/ReadVariableOpReadVariableOp5model_1_batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_7/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_7/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:06model_1/batch_normalization_7/ReadVariableOp_1:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_7/EluElu2model_1/batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_6/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_6/Conv2DConv2D&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_8/ReadVariableOpReadVariableOp5model_1_batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_8/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_8/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:06model_1/batch_normalization_8/ReadVariableOp_1:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_8/EluElu2model_1/batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&model_1/conv2d_7/Conv2D/ReadVariableOpReadVariableOp/model_1_conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ü
model_1/conv2d_7/Conv2DConv2D&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

,model_1/batch_normalization_9/ReadVariableOpReadVariableOp5model_1_batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0¢
.model_1/batch_normalization_9/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0À
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0Ä
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0æ
.model_1/batch_normalization_9/FusedBatchNormV3FusedBatchNormV3 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:06model_1/batch_normalization_9/ReadVariableOp_1:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( 
model_1/activation_9/EluElu2model_1/batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
model_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   ¡
model_1/flatten_1/ReshapeReshape&model_1/activation_9/Elu:activations:0 model_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0¦
model_1/dense_2/MatMulMatMul"model_1/flatten_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_10/batchnorm/addAddV2?model_1/batch_normalization_10/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_10/batchnorm/RsqrtRsqrt0model_1/batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_10/batchnorm/mulMul2model_1/batch_normalization_10/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_10/batchnorm/mul_1Mul model_1/dense_2/MatMul:product:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_10/batchnorm/mul_2MulAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_10/batchnorm/subSubAmodel_1/batch_normalization_10/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_10/batchnorm/add_1AddV22model_1/batch_normalization_10/batchnorm/mul_1:z:00model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_10/EluElu2model_1/batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_2/IdentityIdentity'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0§
model_1/dense_3/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
7model_1/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp@model_1_batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0s
.model_1/batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Õ
,model_1/batch_normalization_11/batchnorm/addAddV2?model_1/batch_normalization_11/batchnorm/ReadVariableOp:value:07model_1/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
.model_1/batch_normalization_11/batchnorm/RsqrtRsqrt0model_1/batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:½
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOpDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0Ò
,model_1/batch_normalization_11/batchnorm/mulMul2model_1/batch_normalization_11/batchnorm/Rsqrt:y:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¼
.model_1/batch_normalization_11/batchnorm/mul_1Mul model_1/dense_3/MatMul:product:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0Ð
.model_1/batch_normalization_11/batchnorm/mul_2MulAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:¹
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOpBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0Ð
,model_1/batch_normalization_11/batchnorm/subSubAmodel_1/batch_normalization_11/batchnorm/ReadVariableOp_2:value:02model_1/batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:Ð
.model_1/batch_normalization_11/batchnorm/add_1AddV22model_1/batch_normalization_11/batchnorm/mul_1:z:00model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/activation_11/EluElu2model_1/batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/dropout_3/IdentityIdentity'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
model_1/v/MatMul/ReadVariableOpReadVariableOp(model_1_v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model_1/v/MatMulMatMul#model_1/dropout_3/Identity:output:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/v/BiasAdd/ReadVariableOpReadVariableOp)model_1_v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
model_1/v/BiasAddBiasAddmodel_1/v/MatMul:product:0(model_1/v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
model_1/v/TanhTanhmodel_1/v/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 model_1/pi/MatMul/ReadVariableOpReadVariableOp)model_1_pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
model_1/pi/MatMulMatMul#model_1/dropout_3/Identity:output:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
!model_1/pi/BiasAdd/ReadVariableOpReadVariableOp*model_1_pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0
model_1/pi/BiasAddBiasAddmodel_1/pi/MatMul:product:0)model_1/pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ m
model_1/pi/SoftmaxSoftmaxmodel_1/pi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ \
subSubmodel_1/v/Tanh:y:0v*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿJ
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowsub:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       F
MeanMeanpow:z:0Const:output:0*
T0*
_output_shapes
: A
NegNegpi*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [
LogLogmodel_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ O
mulMulNeg:y:0Log:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ X
Const_1Const*
_output_shapes
:*
dtype0*
valueB"       J
Mean_1Meanmul:z:0Const_1:output:0*
T0*
_output_shapes
: G
mul_1Mulmul_1_xMean_1:output:0*
T0*
_output_shapes
: G
addAddV2Mean:output:0	mul_1:z:0*
T0*
_output_shapes
: I
onesConst*
_output_shapes
: *
dtype0*
valueB
 *  ?l
gradient_tape/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ~
gradient_tape/ReshapeReshapeones:output:0$gradient_tape/Reshape/shape:output:0*
T0*
_output_shapes

:J
gradient_tape/ShapeShapepow:z:0*
T0*
_output_shapes
:
gradient_tape/TileTilegradient_tape/Reshape:output:0gradient_tape/Shape:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿL
gradient_tape/Shape_1Shapepow:z:0*
T0*
_output_shapes
:X
gradient_tape/Shape_2Const*
_output_shapes
: *
dtype0*
valueB ]
gradient_tape/ConstConst*
_output_shapes
:*
dtype0*
valueB: y
gradient_tape/ProdProdgradient_tape/Shape_1:output:0gradient_tape/Const:output:0*
T0*
_output_shapes
: _
gradient_tape/Const_1Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_1Prodgradient_tape/Shape_2:output:0gradient_tape/Const_1:output:0*
T0*
_output_shapes
: Y
gradient_tape/Maximum/yConst*
_output_shapes
: *
dtype0*
value	B :
gradient_tape/MaximumMaximumgradient_tape/Prod_1:output:0 gradient_tape/Maximum/y:output:0*
T0*
_output_shapes
: {
gradient_tape/floordivFloorDivgradient_tape/Prod:output:0gradient_tape/Maximum:z:0*
T0*
_output_shapes
: f
gradient_tape/CastCastgradient_tape/floordiv:z:0*

DstT0*

SrcT0*
_output_shapes
: 
gradient_tape/truedivRealDivgradient_tape/Tile:output:0gradient_tape/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_
gradient_tape/mul_1/MulMulones:output:0Mean_1:output:0*
T0*
_output_shapes
: Y
gradient_tape/mul_1/Mul_1Mulones:output:0mul_1_x*
T0*
_output_shapes
: 
gradient_tape/pow/mulMulgradient_tape/truediv:z:0pow/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\
gradient_tape/pow/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?o
gradient_tape/pow/subSubpow/y:output:0 gradient_tape/pow/sub/y:output:0*
T0*
_output_shapes
: {
gradient_tape/pow/PowPowsub:z:0gradient_tape/pow/sub:z:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
gradient_tape/pow/mul_1Mulgradient_tape/pow/mul:z:0gradient_tape/pow/Pow:z:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿn
gradient_tape/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"      
gradient_tape/Reshape_1Reshapegradient_tape/mul_1/Mul_1:z:0&gradient_tape/Reshape_1/shape:output:0*
T0*
_output_shapes

:L
gradient_tape/Shape_3Shapemul:z:0*
T0*
_output_shapes
:
gradient_tape/Tile_1Tile gradient_tape/Reshape_1:output:0gradient_tape/Shape_3:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ L
gradient_tape/Shape_4Shapemul:z:0*
T0*
_output_shapes
:X
gradient_tape/Shape_5Const*
_output_shapes
: *
dtype0*
valueB _
gradient_tape/Const_2Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_2Prodgradient_tape/Shape_4:output:0gradient_tape/Const_2:output:0*
T0*
_output_shapes
: _
gradient_tape/Const_3Const*
_output_shapes
:*
dtype0*
valueB: }
gradient_tape/Prod_3Prodgradient_tape/Shape_5:output:0gradient_tape/Const_3:output:0*
T0*
_output_shapes
: [
gradient_tape/Maximum_1/yConst*
_output_shapes
: *
dtype0*
value	B :
gradient_tape/Maximum_1Maximumgradient_tape/Prod_3:output:0"gradient_tape/Maximum_1/y:output:0*
T0*
_output_shapes
: 
gradient_tape/floordiv_1FloorDivgradient_tape/Prod_2:output:0gradient_tape/Maximum_1:z:0*
T0*
_output_shapes
: j
gradient_tape/Cast_1Castgradient_tape/floordiv_1:z:0*

DstT0*

SrcT0*
_output_shapes
: 
gradient_tape/truediv_1RealDivgradient_tape/Tile_1:output:0gradient_tape/Cast_1:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ Y
gradient_tape/sub/ShapeShapemodel_1/v/Tanh:y:0*
T0*
_output_shapes
:J
gradient_tape/sub/Shape_1Shapev*
T0*
_output_shapes
:º
'gradient_tape/sub/BroadcastGradientArgsBroadcastGradientArgs gradient_tape/sub/Shape:output:0"gradient_tape/sub/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
gradient_tape/sub/SumSumgradient_tape/pow/mul_1:z:0,gradient_tape/sub/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
gradient_tape/sub/ReshapeReshapegradient_tape/sub/Sum:output:0 gradient_tape/sub/Shape:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿN
gradient_tape/mul/ShapeShapeNeg:y:0*
T0*
_output_shapes
:P
gradient_tape/mul/Shape_1ShapeLog:y:0*
T0*
_output_shapes
:º
'gradient_tape/mul/BroadcastGradientArgsBroadcastGradientArgs gradient_tape/mul/Shape:output:0"gradient_tape/mul/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿu
gradient_tape/mul/MulMulNeg:y:0gradient_tape/truediv_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/mul/SumSumgradient_tape/mul/Mul:z:0,gradient_tape/mul/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
gradient_tape/mul/ReshapeReshapegradient_tape/mul/Sum:output:0"gradient_tape/mul/Shape_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
 gradient_tape/model_1/v/TanhGradTanhGradmodel_1/v/Tanh:y:0"gradient_tape/sub/Reshape:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
gradient_tape/Reciprocal
Reciprocalmodel_1/pi/Softmax:softmax:0^gradient_tape/mul/Reshape*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/mulMul"gradient_tape/mul/Reshape:output:0gradient_tape/Reciprocal:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
+gradient_tape/model_1/v/BiasAdd/BiasAddGradBiasAddGrad$gradient_tape/model_1/v/TanhGrad:z:0*
T0*
_output_shapes
:
gradient_tape/model_1/pi/mulMulgradient_tape/mul:z:0model_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ y
.gradient_tape/model_1/pi/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÁ
gradient_tape/model_1/pi/SumSum gradient_tape/model_1/pi/mul:z:07gradient_tape/model_1/pi/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
	keep_dims(
gradient_tape/model_1/pi/subSubgradient_tape/mul:z:0%gradient_tape/model_1/pi/Sum:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
gradient_tape/model_1/pi/mul_1Mul gradient_tape/model_1/pi/sub:z:0model_1/pi/Softmax:softmax:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ Ä
%gradient_tape/model_1/v/MatMul/MatMulMatMul$gradient_tape/model_1/v/TanhGrad:z:0'model_1/v/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(¹
'gradient_tape/model_1/v/MatMul/MatMul_1MatMul#model_1/dropout_3/Identity:output:0$gradient_tape/model_1/v/TanhGrad:z:0*
T0*
_output_shapes
:	*
transpose_a(
,gradient_tape/model_1/pi/BiasAdd/BiasAddGradBiasAddGrad"gradient_tape/model_1/pi/mul_1:z:0*
T0*
_output_shapes	
: Ä
&gradient_tape/model_1/pi/MatMul/MatMulMatMul"gradient_tape/model_1/pi/mul_1:z:0(model_1/pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(¹
(gradient_tape/model_1/pi/MatMul/MatMul_1MatMul#model_1/dropout_3/Identity:output:0"gradient_tape/model_1/pi/mul_1:z:0*
T0* 
_output_shapes
:
 *
transpose_a(«
AddNAddN/gradient_tape/model_1/v/MatMul/MatMul:product:00gradient_tape/model_1/pi/MatMul/MatMul:product:0*
N*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
+gradient_tape/model_1/activation_11/EluGradEluGrad
AddN:sum:0'model_1/activation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¤
Bgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/ShapeShape2model_1/batch_normalization_11/batchnorm/mul_1:z:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1Shape0model_1/batch_normalization_11/batchnorm/sub:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿü
@gradient_tape/model_1/batch_normalization_11/batchnorm/add_1/SumSum7gradient_tape/model_1/activation_11/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
Bgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum_1Sum7gradient_tape/model_1/activation_11/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Shape_1:output:0*
T0*
_output_shapes	
:
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/ShapeShape model_1/dense_3/MatMul:product:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1Shape0model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿû
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/MulMulMgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape:output:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/SumSumDgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul:z:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿí
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul_1Mul model_1/dense_3/MatMul:product:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum_1SumFgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Mul_1:z:0Wgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Shape_1:output:0*
T0*
_output_shapes	
:¼
>gradient_tape/model_1/batch_normalization_11/batchnorm/sub/NegNegOgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:ù
+gradient_tape/model_1/dense_3/MatMul/MatMulMatMulMgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(é
-gradient_tape/model_1/dense_3/MatMul/MatMul_1MatMul#model_1/dropout_2/Identity:output:0Mgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape:output:0*
T0* 
_output_shapes
:
*
transpose_a(ã
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/MulMulBgradient_tape/model_1/batch_normalization_11/batchnorm/sub/Neg:y:00model_1/batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:ö
Bgradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/Mul_1MulBgradient_tape/model_1/batch_normalization_11/batchnorm/sub/Neg:y:0Amodel_1/batch_normalization_11/batchnorm/ReadVariableOp_1:value:0*
T0*
_output_shapes	
:Ö
AddN_1AddNOgradient_tape/model_1/batch_normalization_11/batchnorm/mul_1/Reshape_1:output:0Fgradient_tape/model_1/batch_normalization_11/batchnorm/mul_2/Mul_1:z:0*
N*
T0*
_output_shapes	
:¾
>gradient_tape/model_1/batch_normalization_11/batchnorm/mul/MulMulAddN_1:sum:0Cmodel_1/batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¯
@gradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1MulAddN_1:sum:02model_1/batch_normalization_11/batchnorm/Rsqrt:y:0*
T0*
_output_shapes	
:É
+gradient_tape/model_1/activation_10/EluGradEluGrad5gradient_tape/model_1/dense_3/MatMul/MatMul:product:0'model_1/activation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¤
Bgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/ShapeShape2model_1/batch_normalization_10/batchnorm/mul_1:z:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1Shape0model_1/batch_normalization_10/batchnorm/sub:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿü
@gradient_tape/model_1/batch_normalization_10/batchnorm/add_1/SumSum7gradient_tape/model_1/activation_10/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
Bgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum_1Sum7gradient_tape/model_1/activation_10/EluGrad:backprops:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Shape_1:output:0*
T0*
_output_shapes	
:
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/ShapeShape model_1/dense_2/MatMul:product:0*
T0*
_output_shapes
:¤
Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1Shape0model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes
:»
Rgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgsBroadcastGradientArgsKgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1:output:0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿû
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/MulMulMgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape:output:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/SumSumDgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul:z:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgs:r0:0*
T0*
_output_shapes
:
Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/ReshapeReshapeIgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum:output:0Kgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿí
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul_1Mul model_1/dense_2/MatMul:product:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum_1SumFgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Mul_1:z:0Wgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/BroadcastGradientArgs:r1:0*
T0*
_output_shapes
:
Fgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape_1ReshapeKgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Sum_1:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Shape_1:output:0*
T0*
_output_shapes	
:¼
>gradient_tape/model_1/batch_normalization_10/batchnorm/sub/NegNegOgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:ù
+gradient_tape/model_1/dense_2/MatMul/MatMulMatMulMgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ*
transpose_b(è
-gradient_tape/model_1/dense_2/MatMul/MatMul_1MatMul"model_1/flatten_1/Reshape:output:0Mgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape:output:0*
T0* 
_output_shapes
:
À*
transpose_a(ã
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/MulMulBgradient_tape/model_1/batch_normalization_10/batchnorm/sub/Neg:y:00model_1/batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:ö
Bgradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/Mul_1MulBgradient_tape/model_1/batch_normalization_10/batchnorm/sub/Neg:y:0Amodel_1/batch_normalization_10/batchnorm/ReadVariableOp_1:value:0*
T0*
_output_shapes	
:{
%gradient_tape/model_1/flatten_1/ShapeShape&model_1/activation_9/Elu:activations:0*
T0*
_output_shapes
:Ó
'gradient_tape/model_1/flatten_1/ReshapeReshape5gradient_tape/model_1/dense_2/MatMul/MatMul:product:0.gradient_tape/model_1/flatten_1/Shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿÖ
AddN_2AddNOgradient_tape/model_1/batch_normalization_10/batchnorm/mul_1/Reshape_1:output:0Fgradient_tape/model_1/batch_normalization_10/batchnorm/mul_2/Mul_1:z:0*
N*
T0*
_output_shapes	
:¾
>gradient_tape/model_1/batch_normalization_10/batchnorm/mul/MulMulAddN_2:sum:0Cmodel_1/batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¯
@gradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1MulAddN_2:sum:02model_1/batch_normalization_10/batchnorm/Rsqrt:y:0*
T0*
_output_shapes	
:É
*gradient_tape/model_1/activation_9/EluGradEluGrad0gradient_tape/model_1/flatten_1/Reshape:output:0&model_1/activation_9/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
zerosConst*
_output_shapes
:*
dtype0*
valueB*    T
zeros_1Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_2Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_3Const*
_output_shapes
:*
dtype0*
valueB*    |

zeros_like	ZerosLike@model_1/batch_normalization_9/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_9/EluGrad:backprops:0 model_1/conv2d_7/Conv2D:output:04model_1/batch_normalization_9/ReadVariableOp:value:0Emodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_9/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_7/Conv2D/ShapeNShapeN&model_1/activation_8/Elu:activations:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::é
9gradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_7/Conv2D/ShapeN:output:0.model_1/conv2d_7/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
Ú
:gradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_8/Elu:activations:05gradient_tape/model_1/conv2d_7/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingVALID*
strides
Û
*gradient_tape/model_1/activation_8/EluGradEluGradBgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_8/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
zeros_4Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_5Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_6Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_7Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_1	ZerosLike@model_1/batch_normalization_8/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_8/EluGrad:backprops:0 model_1/conv2d_6/Conv2D:output:04model_1/batch_normalization_8/ReadVariableOp:value:0Emodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_8/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_6/Conv2D/ShapeNShapeN&model_1/activation_7/Elu:activations:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::é
9gradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_6/Conv2D/ShapeN:output:0.model_1/conv2d_6/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides
Ú
:gradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_7/Elu:activations:05gradient_tape/model_1/conv2d_6/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingVALID*
strides
Û
*gradient_tape/model_1/activation_7/EluGradEluGradBgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_7/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
zeros_8Const*
_output_shapes
:*
dtype0*
valueB*    T
zeros_9Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_10Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_11Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_2	ZerosLike@model_1/batch_normalization_7/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_7/EluGrad:backprops:0 model_1/conv2d_5/Conv2D:output:04model_1/batch_normalization_7/ReadVariableOp:value:0Emodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_7/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( Â
,gradient_tape/model_1/conv2d_5/Conv2D/ShapeNShapeN&model_1/activation_6/Elu:activations:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::è
9gradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_5/Conv2D/ShapeN:output:0.model_1/conv2d_5/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
Ù
:gradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilterConv2DBackpropFilter&model_1/activation_6/Elu:activations:05gradient_tape/model_1/conv2d_5/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingSAME*
strides
Û
*gradient_tape/model_1/activation_6/EluGradEluGradBgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropInput:output:0&model_1/activation_6/Elu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
zeros_12Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_13Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_14Const*
_output_shapes
:*
dtype0*
valueB*    U
zeros_15Const*
_output_shapes
:*
dtype0*
valueB*    ~
zeros_like_3	ZerosLike@model_1/batch_normalization_6/FusedBatchNormV3:reserve_space_3:0*
T0*
_output_shapes
:¶
@gradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3FusedBatchNormGradV36gradient_tape/model_1/activation_6/EluGrad:backprops:0 model_1/conv2d_4/Conv2D:output:04model_1/batch_normalization_6/ReadVariableOp:value:0Emodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0@model_1/batch_normalization_6/FusedBatchNormV3:reserve_space_3:0*
T0*
U0*C
_output_shapes1
/:ÿÿÿÿÿÿÿÿÿ::: : *
epsilon%o:*
is_training( 
,gradient_tape/model_1/conv2d_4/Conv2D/ShapeNShapeNx.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0*
N*
T0* 
_output_shapes
::è
9gradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropInputConv2DBackpropInput5gradient_tape/model_1/conv2d_4/Conv2D/ShapeN:output:0.model_1/conv2d_4/Conv2D/ReadVariableOp:value:0Mgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:x_backprop:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
´
:gradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilterConv2DBackpropFilterx5gradient_tape/model_1/conv2d_4/Conv2D/ShapeN:output:1Mgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:x_backprop:0*
T0*&
_output_shapes
:*
paddingSAME*
strides
r
Adam/Cast/ReadVariableOpReadVariableOp!adam_cast_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/IdentityIdentity Adam/Cast/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: h
Adam/ReadVariableOpReadVariableOpadam_readvariableop_resource*
_output_shapes
: *
dtype0	z

Adam/add/yConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0	*
value	B	 R
Adam/addAddV2Adam/ReadVariableOp:value:0Adam/add/y:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0	*
_output_shapes
: 
Adam/Cast_1CastAdam/add:z:0",/job:localhost/replica:0/task:0/device:CPU:0*

DstT0*

SrcT0	*
_output_shapes
: v
Adam/Cast_2/ReadVariableOpReadVariableOp#adam_cast_2_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/Identity_1Identity"Adam/Cast_2/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: v
Adam/Cast_3/ReadVariableOpReadVariableOp#adam_cast_3_readvariableop_resource*
_output_shapes
: *
dtype0
Adam/Identity_2Identity"Adam/Cast_3/ReadVariableOp:value:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/PowPowAdam/Identity_1:output:0Adam/Cast_1:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 

Adam/Pow_1PowAdam/Identity_2:output:0Adam/Cast_1:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: }

Adam/sub/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?
Adam/subSubAdam/sub/x:output:0Adam/Pow_1:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: n
	Adam/SqrtSqrtAdam/sub:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/sub_1/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_1SubAdam/sub_1/x:output:0Adam/Pow:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/truedivRealDivAdam/Sqrt:y:0Adam/sub_1:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/mulMulAdam/Identity:output:0Adam/truediv:z:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: }

Adam/ConstConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *¿Ö3
Adam/sub_2/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_2SubAdam/sub_2/x:output:0Adam/Identity_1:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/sub_3/xConst",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *  ?

Adam/sub_3SubAdam/sub_3/x:output:0Adam/Identity_2:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*
_output_shapes
: 
Adam/Identity_3IdentityCgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_4IdentityQgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_5IdentityRgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_6IdentityCgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_7IdentityQgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_8IdentityRgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_9IdentityCgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_10IdentityQgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_11IdentityRgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_12IdentityCgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0*
T0*&
_output_shapes
:
Adam/Identity_13IdentityQgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0*
T0*
_output_shapes
:
Adam/Identity_14IdentityRgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:0*
T0*
_output_shapes
:
Adam/Identity_15Identity7gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:
À
Adam/Identity_16IdentityDgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0*
T0*
_output_shapes	
:
Adam/Identity_17IdentityOgradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:
Adam/Identity_18Identity7gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:

Adam/Identity_19IdentityDgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0*
T0*
_output_shapes	
:
Adam/Identity_20IdentityOgradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:0*
T0*
_output_shapes	
:{
Adam/Identity_21Identity2gradient_tape/model_1/pi/MatMul/MatMul_1:product:0*
T0* 
_output_shapes
:
 y
Adam/Identity_22Identity5gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:0*
T0*
_output_shapes	
: y
Adam/Identity_23Identity1gradient_tape/model_1/v/MatMul/MatMul_1:product:0*
T0*
_output_shapes
:	w
Adam/Identity_24Identity4gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0*
T0*
_output_shapes
:ÿ
Adam/IdentityN	IdentityNCgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:07gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:07gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:02gradient_tape/model_1/pi/MatMul/MatMul_1:product:05gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:01gradient_tape/model_1/v/MatMul/MatMul_1:product:04gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0Cgradient_tape/model_1/conv2d_4/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_6/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_5/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_7/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_6/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_8/FusedBatchNormGradV3:offset_backprop:0Cgradient_tape/model_1/conv2d_7/Conv2D/Conv2DBackpropFilter:output:0Qgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:scale_backprop:0Rgradient_tape/model_1/batch_normalization_9/FusedBatchNormGradV3:offset_backprop:07gradient_tape/model_1/dense_2/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_10/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_10/batchnorm/add_1/Reshape_1:output:07gradient_tape/model_1/dense_3/MatMul/MatMul_1:product:0Dgradient_tape/model_1/batch_normalization_11/batchnorm/mul/Mul_1:z:0Ogradient_tape/model_1/batch_normalization_11/batchnorm/add_1/Reshape_1:output:02gradient_tape/model_1/pi/MatMul/MatMul_1:product:05gradient_tape/model_1/pi/BiasAdd/BiasAddGrad:output:01gradient_tape/model_1/v/MatMul/MatMul_1:product:04gradient_tape/model_1/v/BiasAdd/BiasAddGrad:output:0*5
T0
.2,**
_gradient_op_typeCustomGradient-2022*¶
_output_shapes£
 :::::::::::::
À:::
:::
 : :	::::::::::::::
À:::
:::
 : :	:
"Adam/Adam/update/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_4_conv2d_readvariableop_resource$adam_adam_update_resourceapplyadam_m$adam_adam_update_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:0'^model_1/conv2d_4/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_1/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_6_readvariableop_resource&adam_adam_update_1_resourceapplyadam_m&adam_adam_update_1_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:1-^model_1/batch_normalization_6/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_2/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_6_readvariableop_1_resource&adam_adam_update_2_resourceapplyadam_m&adam_adam_update_2_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:2/^model_1/batch_normalization_6/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_5_conv2d_readvariableop_resource&adam_adam_update_3_resourceapplyadam_m&adam_adam_update_3_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:3'^model_1/conv2d_5/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_4/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_7_readvariableop_resource&adam_adam_update_4_resourceapplyadam_m&adam_adam_update_4_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:4-^model_1/batch_normalization_7/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_5/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_7_readvariableop_1_resource&adam_adam_update_5_resourceapplyadam_m&adam_adam_update_5_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:5/^model_1/batch_normalization_7/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_6/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_6_conv2d_readvariableop_resource&adam_adam_update_6_resourceapplyadam_m&adam_adam_update_6_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:6'^model_1/conv2d_6/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(±
$Adam/Adam/update_7/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_8_readvariableop_resource&adam_adam_update_7_resourceapplyadam_m&adam_adam_update_7_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:7-^model_1/batch_normalization_8/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource*
_output_shapes
 *
use_locking(·
$Adam/Adam/update_8/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_8_readvariableop_1_resource&adam_adam_update_8_resourceapplyadam_m&adam_adam_update_8_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:8/^model_1/batch_normalization_8/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking(
$Adam/Adam/update_9/ResourceApplyAdamResourceApplyAdam/model_1_conv2d_7_conv2d_readvariableop_resource&adam_adam_update_9_resourceapplyadam_m&adam_adam_update_9_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:9'^model_1/conv2d_7/Conv2D/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource*
_output_shapes
 *
use_locking(µ
%Adam/Adam/update_10/ResourceApplyAdamResourceApplyAdam5model_1_batch_normalization_9_readvariableop_resource'adam_adam_update_10_resourceapplyadam_m'adam_adam_update_10_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:10-^model_1/batch_normalization_9/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource*
_output_shapes
 *
use_locking(»
%Adam/Adam/update_11/ResourceApplyAdamResourceApplyAdam7model_1_batch_normalization_9_readvariableop_1_resource'adam_adam_update_11_resourceapplyadam_m'adam_adam_update_11_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:11/^model_1/batch_normalization_9/ReadVariableOp_1",/job:localhost/replica:0/task:0/device:CPU:0*
T0*J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource*
_output_shapes
 *
use_locking( 
%Adam/Adam/update_12/ResourceApplyAdamResourceApplyAdam.model_1_dense_2_matmul_readvariableop_resource'adam_adam_update_12_resourceapplyadam_m'adam_adam_update_12_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:12&^model_1/dense_2/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(â
%Adam/Adam/update_13/ResourceApplyAdamResourceApplyAdamDmodel_1_batch_normalization_10_batchnorm_mul_readvariableop_resource'adam_adam_update_13_resourceapplyadam_m'adam_adam_update_13_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:13<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ü
%Adam/Adam/update_14/ResourceApplyAdamResourceApplyAdamBmodel_1_batch_normalization_10_batchnorm_readvariableop_2_resource'adam_adam_update_14_resourceapplyadam_m'adam_adam_update_14_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:14:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2",/job:localhost/replica:0/task:0/device:CPU:0*
T0*U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource*
_output_shapes
 *
use_locking( 
%Adam/Adam/update_15/ResourceApplyAdamResourceApplyAdam.model_1_dense_3_matmul_readvariableop_resource'adam_adam_update_15_resourceapplyadam_m'adam_adam_update_15_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:15&^model_1/dense_3/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(â
%Adam/Adam/update_16/ResourceApplyAdamResourceApplyAdamDmodel_1_batch_normalization_11_batchnorm_mul_readvariableop_resource'adam_adam_update_16_resourceapplyadam_m'adam_adam_update_16_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:16<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ü
%Adam/Adam/update_17/ResourceApplyAdamResourceApplyAdamBmodel_1_batch_normalization_11_batchnorm_readvariableop_2_resource'adam_adam_update_17_resourceapplyadam_m'adam_adam_update_17_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:17:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2",/job:localhost/replica:0/task:0/device:CPU:0*
T0*U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_18/ResourceApplyAdamResourceApplyAdam)model_1_pi_matmul_readvariableop_resource'adam_adam_update_18_resourceapplyadam_m'adam_adam_update_18_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:18!^model_1/pi/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_19/ResourceApplyAdamResourceApplyAdam*model_1_pi_biasadd_readvariableop_resource'adam_adam_update_19_resourceapplyadam_m'adam_adam_update_19_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:19"^model_1/pi/BiasAdd/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_20/ResourceApplyAdamResourceApplyAdam(model_1_v_matmul_readvariableop_resource'adam_adam_update_20_resourceapplyadam_m'adam_adam_update_20_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:20 ^model_1/v/MatMul/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource*
_output_shapes
 *
use_locking(
%Adam/Adam/update_21/ResourceApplyAdamResourceApplyAdam)model_1_v_biasadd_readvariableop_resource'adam_adam_update_21_resourceapplyadam_m'adam_adam_update_21_resourceapplyadam_vAdam/Pow:z:0Adam/Pow_1:z:0Adam/Identity:output:0Adam/Identity_1:output:0Adam/Identity_2:output:0Adam/Const:output:0Adam/IdentityN:output:21!^model_1/v/BiasAdd/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource*
_output_shapes
 *
use_locking(Ä
Adam/Adam/group_depsNoOp#^Adam/Adam/update/ResourceApplyAdam%^Adam/Adam/update_1/ResourceApplyAdam&^Adam/Adam/update_10/ResourceApplyAdam&^Adam/Adam/update_11/ResourceApplyAdam&^Adam/Adam/update_12/ResourceApplyAdam&^Adam/Adam/update_13/ResourceApplyAdam&^Adam/Adam/update_14/ResourceApplyAdam&^Adam/Adam/update_15/ResourceApplyAdam&^Adam/Adam/update_16/ResourceApplyAdam&^Adam/Adam/update_17/ResourceApplyAdam&^Adam/Adam/update_18/ResourceApplyAdam&^Adam/Adam/update_19/ResourceApplyAdam%^Adam/Adam/update_2/ResourceApplyAdam&^Adam/Adam/update_20/ResourceApplyAdam&^Adam/Adam/update_21/ResourceApplyAdam%^Adam/Adam/update_3/ResourceApplyAdam%^Adam/Adam/update_4/ResourceApplyAdam%^Adam/Adam/update_5/ResourceApplyAdam%^Adam/Adam/update_6/ResourceApplyAdam%^Adam/Adam/update_7/ResourceApplyAdam%^Adam/Adam/update_8/ResourceApplyAdam%^Adam/Adam/update_9/ResourceApplyAdam",/job:localhost/replica:0/task:0/device:CPU:0*
_output_shapes
 h
Adam/Adam/ConstConst^Adam/Adam/group_deps*
_output_shapes
: *
dtype0	*
value	B	 R¥
Adam/Adam/AssignAddVariableOpAssignAddVariableOpadam_readvariableop_resourceAdam/Adam/Const:output:0^Adam/ReadVariableOp*
_output_shapes
 *
dtype0	K
IdentityIdentityMean:output:0^NoOp*
T0*
_output_shapes
: O

Identity_1IdentityMean_1:output:0^NoOp*
T0*
_output_shapes
: G

Identity_2Identityadd:z:0^NoOp*
T0*
_output_shapes
: 
NoOpNoOp^Adam/Adam/AssignAddVariableOp#^Adam/Adam/update/ResourceApplyAdam%^Adam/Adam/update_1/ResourceApplyAdam&^Adam/Adam/update_10/ResourceApplyAdam&^Adam/Adam/update_11/ResourceApplyAdam&^Adam/Adam/update_12/ResourceApplyAdam&^Adam/Adam/update_13/ResourceApplyAdam&^Adam/Adam/update_14/ResourceApplyAdam&^Adam/Adam/update_15/ResourceApplyAdam&^Adam/Adam/update_16/ResourceApplyAdam&^Adam/Adam/update_17/ResourceApplyAdam&^Adam/Adam/update_18/ResourceApplyAdam&^Adam/Adam/update_19/ResourceApplyAdam%^Adam/Adam/update_2/ResourceApplyAdam&^Adam/Adam/update_20/ResourceApplyAdam&^Adam/Adam/update_21/ResourceApplyAdam%^Adam/Adam/update_3/ResourceApplyAdam%^Adam/Adam/update_4/ResourceApplyAdam%^Adam/Adam/update_5/ResourceApplyAdam%^Adam/Adam/update_6/ResourceApplyAdam%^Adam/Adam/update_7/ResourceApplyAdam%^Adam/Adam/update_8/ResourceApplyAdam%^Adam/Adam/update_9/ResourceApplyAdam^Adam/Cast/ReadVariableOp^Adam/Cast_2/ReadVariableOp^Adam/Cast_3/ReadVariableOp^Adam/ReadVariableOp8^model_1/batch_normalization_10/batchnorm/ReadVariableOp:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_10/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp8^model_1/batch_normalization_11/batchnorm/ReadVariableOp:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_1:^model_1/batch_normalization_11/batchnorm/ReadVariableOp_2<^model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp>^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_6/ReadVariableOp/^model_1/batch_normalization_6/ReadVariableOp_1>^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_7/ReadVariableOp/^model_1/batch_normalization_7/ReadVariableOp_1>^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_8/ReadVariableOp/^model_1/batch_normalization_8/ReadVariableOp_1>^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp@^model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1-^model_1/batch_normalization_9/ReadVariableOp/^model_1/batch_normalization_9/ReadVariableOp_1'^model_1/conv2d_4/Conv2D/ReadVariableOp'^model_1/conv2d_5/Conv2D/ReadVariableOp'^model_1/conv2d_6/Conv2D/ReadVariableOp'^model_1/conv2d_7/Conv2D/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp"^model_1/pi/BiasAdd/ReadVariableOp!^model_1/pi/MatMul/ReadVariableOp!^model_1/v/BiasAdd/ReadVariableOp ^model_1/v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*ù
_input_shapesç
ä:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2>
Adam/Adam/AssignAddVariableOpAdam/Adam/AssignAddVariableOp2H
"Adam/Adam/update/ResourceApplyAdam"Adam/Adam/update/ResourceApplyAdam2L
$Adam/Adam/update_1/ResourceApplyAdam$Adam/Adam/update_1/ResourceApplyAdam2N
%Adam/Adam/update_10/ResourceApplyAdam%Adam/Adam/update_10/ResourceApplyAdam2N
%Adam/Adam/update_11/ResourceApplyAdam%Adam/Adam/update_11/ResourceApplyAdam2N
%Adam/Adam/update_12/ResourceApplyAdam%Adam/Adam/update_12/ResourceApplyAdam2N
%Adam/Adam/update_13/ResourceApplyAdam%Adam/Adam/update_13/ResourceApplyAdam2N
%Adam/Adam/update_14/ResourceApplyAdam%Adam/Adam/update_14/ResourceApplyAdam2N
%Adam/Adam/update_15/ResourceApplyAdam%Adam/Adam/update_15/ResourceApplyAdam2N
%Adam/Adam/update_16/ResourceApplyAdam%Adam/Adam/update_16/ResourceApplyAdam2N
%Adam/Adam/update_17/ResourceApplyAdam%Adam/Adam/update_17/ResourceApplyAdam2N
%Adam/Adam/update_18/ResourceApplyAdam%Adam/Adam/update_18/ResourceApplyAdam2N
%Adam/Adam/update_19/ResourceApplyAdam%Adam/Adam/update_19/ResourceApplyAdam2L
$Adam/Adam/update_2/ResourceApplyAdam$Adam/Adam/update_2/ResourceApplyAdam2N
%Adam/Adam/update_20/ResourceApplyAdam%Adam/Adam/update_20/ResourceApplyAdam2N
%Adam/Adam/update_21/ResourceApplyAdam%Adam/Adam/update_21/ResourceApplyAdam2L
$Adam/Adam/update_3/ResourceApplyAdam$Adam/Adam/update_3/ResourceApplyAdam2L
$Adam/Adam/update_4/ResourceApplyAdam$Adam/Adam/update_4/ResourceApplyAdam2L
$Adam/Adam/update_5/ResourceApplyAdam$Adam/Adam/update_5/ResourceApplyAdam2L
$Adam/Adam/update_6/ResourceApplyAdam$Adam/Adam/update_6/ResourceApplyAdam2L
$Adam/Adam/update_7/ResourceApplyAdam$Adam/Adam/update_7/ResourceApplyAdam2L
$Adam/Adam/update_8/ResourceApplyAdam$Adam/Adam/update_8/ResourceApplyAdam2L
$Adam/Adam/update_9/ResourceApplyAdam$Adam/Adam/update_9/ResourceApplyAdam24
Adam/Cast/ReadVariableOpAdam/Cast/ReadVariableOp28
Adam/Cast_2/ReadVariableOpAdam/Cast_2/ReadVariableOp28
Adam/Cast_3/ReadVariableOpAdam/Cast_3/ReadVariableOp2*
Adam/ReadVariableOpAdam/ReadVariableOp2r
7model_1/batch_normalization_10/batchnorm/ReadVariableOp7model_1/batch_normalization_10/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_19model_1/batch_normalization_10/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_10/batchnorm/ReadVariableOp_29model_1/batch_normalization_10/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp2r
7model_1/batch_normalization_11/batchnorm/ReadVariableOp7model_1/batch_normalization_11/batchnorm/ReadVariableOp2v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_19model_1/batch_normalization_11/batchnorm/ReadVariableOp_12v
9model_1/batch_normalization_11/batchnorm/ReadVariableOp_29model_1/batch_normalization_11/batchnorm/ReadVariableOp_22z
;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp;model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp2~
=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_6/ReadVariableOp,model_1/batch_normalization_6/ReadVariableOp2`
.model_1/batch_normalization_6/ReadVariableOp_1.model_1/batch_normalization_6/ReadVariableOp_12~
=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_7/ReadVariableOp,model_1/batch_normalization_7/ReadVariableOp2`
.model_1/batch_normalization_7/ReadVariableOp_1.model_1/batch_normalization_7/ReadVariableOp_12~
=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_8/ReadVariableOp,model_1/batch_normalization_8/ReadVariableOp2`
.model_1/batch_normalization_8/ReadVariableOp_1.model_1/batch_normalization_8/ReadVariableOp_12~
=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp=model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp2
?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1?model_1/batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12\
,model_1/batch_normalization_9/ReadVariableOp,model_1/batch_normalization_9/ReadVariableOp2`
.model_1/batch_normalization_9/ReadVariableOp_1.model_1/batch_normalization_9/ReadVariableOp_12P
&model_1/conv2d_4/Conv2D/ReadVariableOp&model_1/conv2d_4/Conv2D/ReadVariableOp2P
&model_1/conv2d_5/Conv2D/ReadVariableOp&model_1/conv2d_5/Conv2D/ReadVariableOp2P
&model_1/conv2d_6/Conv2D/ReadVariableOp&model_1/conv2d_6/Conv2D/ReadVariableOp2P
&model_1/conv2d_7/Conv2D/ReadVariableOp&model_1/conv2d_7/Conv2D/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2F
!model_1/pi/BiasAdd/ReadVariableOp!model_1/pi/BiasAdd/ReadVariableOp2D
 model_1/pi/MatMul/ReadVariableOp model_1/pi/MatMul/ReadVariableOp2D
 model_1/v/BiasAdd/ReadVariableOp model_1/v/BiasAdd/ReadVariableOp2B
model_1/v/MatMul/ReadVariableOpmodel_1/v/MatMul/ReadVariableOp:R N
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:LH
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:%

_output_shapes
: :H*D
B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource:H+D
B
_class8
64loc:@model_1/conv2d_4/Conv2D/ReadVariableOp/resource:N,J
H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource:N-J
H
_class>
<:loc:@model_1/batch_normalization_6/ReadVariableOp/resource:P.L
J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource:P/L
J
_class@
><loc:@model_1/batch_normalization_6/ReadVariableOp_1/resource:H0D
B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource:H1D
B
_class8
64loc:@model_1/conv2d_5/Conv2D/ReadVariableOp/resource:N2J
H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource:N3J
H
_class>
<:loc:@model_1/batch_normalization_7/ReadVariableOp/resource:P4L
J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource:P5L
J
_class@
><loc:@model_1/batch_normalization_7/ReadVariableOp_1/resource:H6D
B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource:H7D
B
_class8
64loc:@model_1/conv2d_6/Conv2D/ReadVariableOp/resource:N8J
H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource:N9J
H
_class>
<:loc:@model_1/batch_normalization_8/ReadVariableOp/resource:P:L
J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource:P;L
J
_class@
><loc:@model_1/batch_normalization_8/ReadVariableOp_1/resource:H<D
B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource:H=D
B
_class8
64loc:@model_1/conv2d_7/Conv2D/ReadVariableOp/resource:N>J
H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource:N?J
H
_class>
<:loc:@model_1/batch_normalization_9/ReadVariableOp/resource:P@L
J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource:PAL
J
_class@
><loc:@model_1/batch_normalization_9/ReadVariableOp_1/resource:GBC
A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource:GCC
A
_class7
53loc:@model_1/dense_2/MatMul/ReadVariableOp/resource:]DY
W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource:]EY
W
_classM
KIloc:@model_1/batch_normalization_10/batchnorm/mul/ReadVariableOp/resource:[FW
U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource:[GW
U
_classK
IGloc:@model_1/batch_normalization_10/batchnorm/ReadVariableOp_2/resource:GHC
A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource:GIC
A
_class7
53loc:@model_1/dense_3/MatMul/ReadVariableOp/resource:]JY
W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource:]KY
W
_classM
KIloc:@model_1/batch_normalization_11/batchnorm/mul/ReadVariableOp/resource:[LW
U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource:[MW
U
_classK
IGloc:@model_1/batch_normalization_11/batchnorm/ReadVariableOp_2/resource:BN>
<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource:BO>
<
_class2
0.loc:@model_1/pi/MatMul/ReadVariableOp/resource:CP?
=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource:CQ?
=
_class3
1/loc:@model_1/pi/BiasAdd/ReadVariableOp/resource:AR=
;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource:AS=
;
_class1
/-loc:@model_1/v/MatMul/ReadVariableOp/resource:BT>
<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource:BU>
<
_class2
0.loc:@model_1/v/BiasAdd/ReadVariableOp/resource
n
±
A__inference_model_1_layer_call_and_return_conditional_losses_5231

inputs'
conv2d_4_5138:(
batch_normalization_6_5141:(
batch_normalization_6_5143:(
batch_normalization_6_5145:(
batch_normalization_6_5147:'
conv2d_5_5151:(
batch_normalization_7_5154:(
batch_normalization_7_5156:(
batch_normalization_7_5158:(
batch_normalization_7_5160:'
conv2d_6_5164:(
batch_normalization_8_5167:(
batch_normalization_8_5169:(
batch_normalization_8_5171:(
batch_normalization_8_5173:'
conv2d_7_5177:(
batch_normalization_9_5180:(
batch_normalization_9_5182:(
batch_normalization_9_5184:(
batch_normalization_9_5186: 
dense_2_5191:
À*
batch_normalization_10_5194:	*
batch_normalization_10_5196:	*
batch_normalization_10_5198:	*
batch_normalization_10_5200:	 
dense_3_5205:
*
batch_normalization_11_5208:	*
batch_normalization_11_5210:	*
batch_normalization_11_5212:	*
batch_normalization_11_5214:	
v_5219:	
v_5221:
pi_5224:
 
pi_5226:	 
identity

identity_1¢.batch_normalization_10/StatefulPartitionedCall¢.batch_normalization_11/StatefulPartitionedCall¢-batch_normalization_6/StatefulPartitionedCall¢-batch_normalization_7/StatefulPartitionedCall¢-batch_normalization_8/StatefulPartitionedCall¢-batch_normalization_9/StatefulPartitionedCall¢ conv2d_4/StatefulPartitionedCall¢ conv2d_5/StatefulPartitionedCall¢ conv2d_6/StatefulPartitionedCall¢ conv2d_7/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢!dropout_2/StatefulPartitionedCall¢!dropout_3/StatefulPartitionedCall¢pi/StatefulPartitionedCall¢v/StatefulPartitionedCallá
 conv2d_4/StatefulPartitionedCallStatefulPartitionedCallinputsconv2d_4_5138*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616
-batch_normalization_6/StatefulPartitionedCallStatefulPartitionedCall)conv2d_4/StatefulPartitionedCall:output:0batch_normalization_6_5141batch_normalization_6_5143batch_normalization_6_5145batch_normalization_6_5147*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4235ö
activation_6/PartitionedCallPartitionedCall6batch_normalization_6/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_6_layer_call_and_return_conditional_losses_4634
 conv2d_5/StatefulPartitionedCallStatefulPartitionedCall%activation_6/PartitionedCall:output:0conv2d_5_5151*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643
-batch_normalization_7/StatefulPartitionedCallStatefulPartitionedCall)conv2d_5/StatefulPartitionedCall:output:0batch_normalization_7_5154batch_normalization_7_5156batch_normalization_7_5158batch_normalization_7_5160*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4299ö
activation_7/PartitionedCallPartitionedCall6batch_normalization_7/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_7_layer_call_and_return_conditional_losses_4661
 conv2d_6/StatefulPartitionedCallStatefulPartitionedCall%activation_7/PartitionedCall:output:0conv2d_6_5164*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670
-batch_normalization_8/StatefulPartitionedCallStatefulPartitionedCall)conv2d_6/StatefulPartitionedCall:output:0batch_normalization_8_5167batch_normalization_8_5169batch_normalization_8_5171batch_normalization_8_5173*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4363ö
activation_8/PartitionedCallPartitionedCall6batch_normalization_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_8_layer_call_and_return_conditional_losses_4688
 conv2d_7/StatefulPartitionedCallStatefulPartitionedCall%activation_8/PartitionedCall:output:0conv2d_7_5177*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697
-batch_normalization_9/StatefulPartitionedCallStatefulPartitionedCall)conv2d_7/StatefulPartitionedCall:output:0batch_normalization_9_5180batch_normalization_9_5182batch_normalization_9_5184batch_normalization_9_5186*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4427ö
activation_9/PartitionedCallPartitionedCall6batch_normalization_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_9_layer_call_and_return_conditional_losses_4715Ø
flatten_1/PartitionedCallPartitionedCall%activation_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723ó
dense_2/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_2_5191*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_4732
.batch_normalization_10/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0batch_normalization_10_5194batch_normalization_10_5196batch_normalization_10_5198batch_normalization_10_5200*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4509ò
activation_10/PartitionedCallPartitionedCall7batch_normalization_10/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_10_layer_call_and_return_conditional_losses_4750é
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall&activation_10/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4979û
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_3_5205*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_3_layer_call_and_return_conditional_losses_4766
.batch_normalization_11/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0batch_normalization_11_5208batch_normalization_11_5210batch_normalization_11_5212batch_normalization_11_5214*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4591ò
activation_11/PartitionedCallPartitionedCall7batch_normalization_11/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_11_layer_call_and_return_conditional_losses_4784
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall&activation_11/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4942ò
v/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0v_5219v_5221*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *D
f?R=
;__inference_v_layer_call_and_return_conditional_losses_4804÷
pi/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0pi_5224pi_5226*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *E
f@R>
<__inference_pi_layer_call_and_return_conditional_losses_4821s
IdentityIdentity#pi/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s

Identity_1Identity"v/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
NoOpNoOp/^batch_normalization_10/StatefulPartitionedCall/^batch_normalization_11/StatefulPartitionedCall.^batch_normalization_6/StatefulPartitionedCall.^batch_normalization_7/StatefulPartitionedCall.^batch_normalization_8/StatefulPartitionedCall.^batch_normalization_9/StatefulPartitionedCall!^conv2d_4/StatefulPartitionedCall!^conv2d_5/StatefulPartitionedCall!^conv2d_6/StatefulPartitionedCall!^conv2d_7/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall^pi/StatefulPartitionedCall^v/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_10/StatefulPartitionedCall.batch_normalization_10/StatefulPartitionedCall2`
.batch_normalization_11/StatefulPartitionedCall.batch_normalization_11/StatefulPartitionedCall2^
-batch_normalization_6/StatefulPartitionedCall-batch_normalization_6/StatefulPartitionedCall2^
-batch_normalization_7/StatefulPartitionedCall-batch_normalization_7/StatefulPartitionedCall2^
-batch_normalization_8/StatefulPartitionedCall-batch_normalization_8/StatefulPartitionedCall2^
-batch_normalization_9/StatefulPartitionedCall-batch_normalization_9/StatefulPartitionedCall2D
 conv2d_4/StatefulPartitionedCall conv2d_4/StatefulPartitionedCall2D
 conv2d_5/StatefulPartitionedCall conv2d_5/StatefulPartitionedCall2D
 conv2d_6/StatefulPartitionedCall conv2d_6/StatefulPartitionedCall2D
 conv2d_7/StatefulPartitionedCall conv2d_7/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall28
pi/StatefulPartitionedCallpi/StatefulPartitionedCall26
v/StatefulPartitionedCallv/StatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_5_layer_call_and_return_conditional_losses_6133

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
§
H
,__inference_activation_10_layer_call_fn_6487

inputs
identity³
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_10_layer_call_and_return_conditional_losses_4750a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ñ
a
(__inference_dropout_3_layer_call_fn_6633

inputs
identity¢StatefulPartitionedCall¿
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4942p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
G
+__inference_activation_9_layer_call_fn_6372

inputs
identity¹
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_9_layer_call_and_return_conditional_losses_4715h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4299

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ì
c
G__inference_activation_11_layer_call_and_return_conditional_losses_6623

inputs
identityE
EluEluinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityElu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_6_layer_call_fn_6073

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4235
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Ï
4__inference_batch_normalization_6_layer_call_fn_6060

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4204
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6109

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¯
Ì
"__inference_signature_wrapper_2939
pi
v
x!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 

unknown_33
identity

identity_1

identity_2¢StatefulPartitionedCallð
StatefulPartitionedCallStatefulPartitionedCallxpivunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33*1
Tin*
(2&*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: : : *D
_read_only_resource_inputs&
$"	
 !"#$*-
config_proto

CPU

GPU 2J 8 *'
f"R 
__inference_validate_step_2311^
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: `

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
:ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:L H
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 

_user_specified_namepi:FB
#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namev:RN
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

_user_specified_namex:%

_output_shapes
: 
®%
í
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6613

inputs6
'assignmovingavg_readvariableop_resource:	8
)assignmovingavg_1_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	0
!batchnorm_readvariableop_resource:	
identity¢AssignMovingAvg¢AssignMovingAvg/ReadVariableOp¢AssignMovingAvg_1¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(e
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(n
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 t
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:y
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:¬
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:´
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:r
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:w
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0q
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿê
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¾

'__inference_conv2d_5_layer_call_fn_6126

inputs!
unknown:
identity¢StatefulPartitionedCallÒ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ß
³
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4462

inputs0
!batchnorm_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	2
#batchnorm_readvariableop_1_resource:	2
#batchnorm_readvariableop_2_resource:	
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOpw
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0s
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:{
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0s
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_4_layer_call_and_return_conditional_losses_6047

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ù	
b
C__inference_dropout_3_layer_call_and_return_conditional_losses_6650

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

D
(__inference_dropout_3_layer_call_fn_6628

inputs
identity¯
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4791a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6091

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ú
a
C__inference_dropout_3_layer_call_and_return_conditional_losses_4791

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ù	
b
C__inference_dropout_2_layer_call_and_return_conditional_losses_6519

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4268

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

³
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643

inputs8
conv2d_readvariableop_resource:
identity¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¾

'__inference_conv2d_7_layer_call_fn_6298

inputs!
unknown:
identity¢StatefulPartitionedCallÒ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
®
Ô
5__inference_batch_normalization_11_layer_call_fn_6546

inputs
unknown:	
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4544p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ü£
Ö
 __inference_reset_optimizer_3376
options#
assignvariableop_resource:	 5
assignvariableop_1_resource:)
assignvariableop_2_resource:)
assignvariableop_3_resource:5
assignvariableop_4_resource:)
assignvariableop_5_resource:)
assignvariableop_6_resource:5
assignvariableop_7_resource:)
assignvariableop_8_resource:)
assignvariableop_9_resource:6
assignvariableop_10_resource:*
assignvariableop_11_resource:*
assignvariableop_12_resource:0
assignvariableop_13_resource:
À+
assignvariableop_14_resource:	+
assignvariableop_15_resource:	0
assignvariableop_16_resource:
+
assignvariableop_17_resource:	+
assignvariableop_18_resource:	0
assignvariableop_19_resource:
 +
assignvariableop_20_resource:	 /
assignvariableop_21_resource:	*
assignvariableop_22_resource:6
assignvariableop_23_resource:*
assignvariableop_24_resource:*
assignvariableop_25_resource:6
assignvariableop_26_resource:*
assignvariableop_27_resource:*
assignvariableop_28_resource:6
assignvariableop_29_resource:*
assignvariableop_30_resource:*
assignvariableop_31_resource:6
assignvariableop_32_resource:*
assignvariableop_33_resource:*
assignvariableop_34_resource:0
assignvariableop_35_resource:
À+
assignvariableop_36_resource:	+
assignvariableop_37_resource:	0
assignvariableop_38_resource:
+
assignvariableop_39_resource:	+
assignvariableop_40_resource:	0
assignvariableop_41_resource:
 +
assignvariableop_42_resource:	 /
assignvariableop_43_resource:	*
assignvariableop_44_resource:
identity¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_31¢AssignVariableOp_32¢AssignVariableOp_33¢AssignVariableOp_34¢AssignVariableOp_35¢AssignVariableOp_36¢AssignVariableOp_37¢AssignVariableOp_38¢AssignVariableOp_39¢AssignVariableOp_4¢AssignVariableOp_40¢AssignVariableOp_41¢AssignVariableOp_42¢AssignVariableOp_43¢AssignVariableOp_44¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9L

zeros_likeConst*
_output_shapes
: *
dtype0	*
value	B	 R w
AssignVariableOpAssignVariableOpassignvariableop_resourcezeros_like:output:0*
_output_shapes
 *
dtype0	q
zeros_like_1Const*&
_output_shapes
:*
dtype0*%
valueB*    }
AssignVariableOp_1AssignVariableOpassignvariableop_1_resourcezeros_like_1:output:0*
_output_shapes
 *
dtype0Y
zeros_like_2Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_2AssignVariableOpassignvariableop_2_resourcezeros_like_2:output:0*
_output_shapes
 *
dtype0Y
zeros_like_3Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_3AssignVariableOpassignvariableop_3_resourcezeros_like_3:output:0*
_output_shapes
 *
dtype0u
zeros_like_4/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            W
zeros_like_4/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_4Fill%zeros_like_4/shape_as_tensor:output:0zeros_like_4/Const:output:0*
T0*&
_output_shapes
:}
AssignVariableOp_4AssignVariableOpassignvariableop_4_resourcezeros_like_4:output:0*
_output_shapes
 *
dtype0Y
zeros_like_5Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_5AssignVariableOpassignvariableop_5_resourcezeros_like_5:output:0*
_output_shapes
 *
dtype0Y
zeros_like_6Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_6AssignVariableOpassignvariableop_6_resourcezeros_like_6:output:0*
_output_shapes
 *
dtype0u
zeros_like_7/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            W
zeros_like_7/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_7Fill%zeros_like_7/shape_as_tensor:output:0zeros_like_7/Const:output:0*
T0*&
_output_shapes
:}
AssignVariableOp_7AssignVariableOpassignvariableop_7_resourcezeros_like_7:output:0*
_output_shapes
 *
dtype0Y
zeros_like_8Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_8AssignVariableOpassignvariableop_8_resourcezeros_like_8:output:0*
_output_shapes
 *
dtype0Y
zeros_like_9Const*
_output_shapes
:*
dtype0*
valueB*    }
AssignVariableOp_9AssignVariableOpassignvariableop_9_resourcezeros_like_9:output:0*
_output_shapes
 *
dtype0v
zeros_like_10/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_10/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_10Fill&zeros_like_10/shape_as_tensor:output:0zeros_like_10/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_10AssignVariableOpassignvariableop_10_resourcezeros_like_10:output:0*
_output_shapes
 *
dtype0Z
zeros_like_11Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_11AssignVariableOpassignvariableop_11_resourcezeros_like_11:output:0*
_output_shapes
 *
dtype0Z
zeros_like_12Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_12AssignVariableOpassignvariableop_12_resourcezeros_like_12:output:0*
_output_shapes
 *
dtype0n
zeros_like_13/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"À      X
zeros_like_13/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_13Fill&zeros_like_13/shape_as_tensor:output:0zeros_like_13/Const:output:0*
T0* 
_output_shapes
:
À
AssignVariableOp_13AssignVariableOpassignvariableop_13_resourcezeros_like_13:output:0*
_output_shapes
 *
dtype0h
zeros_like_14/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_14/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_14Fill&zeros_like_14/shape_as_tensor:output:0zeros_like_14/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_14AssignVariableOpassignvariableop_14_resourcezeros_like_14:output:0*
_output_shapes
 *
dtype0h
zeros_like_15/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_15/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_15Fill&zeros_like_15/shape_as_tensor:output:0zeros_like_15/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_15AssignVariableOpassignvariableop_15_resourcezeros_like_15:output:0*
_output_shapes
 *
dtype0n
zeros_like_16/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_16/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_16Fill&zeros_like_16/shape_as_tensor:output:0zeros_like_16/Const:output:0*
T0* 
_output_shapes
:

AssignVariableOp_16AssignVariableOpassignvariableop_16_resourcezeros_like_16:output:0*
_output_shapes
 *
dtype0\
zeros_like_17Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_17AssignVariableOpassignvariableop_17_resourcezeros_like_17:output:0*
_output_shapes
 *
dtype0\
zeros_like_18Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_18AssignVariableOpassignvariableop_18_resourcezeros_like_18:output:0*
_output_shapes
 *
dtype0n
zeros_like_19/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_19/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_19Fill&zeros_like_19/shape_as_tensor:output:0zeros_like_19/Const:output:0*
T0* 
_output_shapes
:
 
AssignVariableOp_19AssignVariableOpassignvariableop_19_resourcezeros_like_19:output:0*
_output_shapes
 *
dtype0h
zeros_like_20/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB: X
zeros_like_20/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_20Fill&zeros_like_20/shape_as_tensor:output:0zeros_like_20/Const:output:0*
T0*
_output_shapes	
: 
AssignVariableOp_20AssignVariableOpassignvariableop_20_resourcezeros_like_20:output:0*
_output_shapes
 *
dtype0d
zeros_like_21Const*
_output_shapes
:	*
dtype0*
valueB	*    
AssignVariableOp_21AssignVariableOpassignvariableop_21_resourcezeros_like_21:output:0*
_output_shapes
 *
dtype0Z
zeros_like_22Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_22AssignVariableOpassignvariableop_22_resourcezeros_like_22:output:0*
_output_shapes
 *
dtype0r
zeros_like_23Const*&
_output_shapes
:*
dtype0*%
valueB*    
AssignVariableOp_23AssignVariableOpassignvariableop_23_resourcezeros_like_23:output:0*
_output_shapes
 *
dtype0Z
zeros_like_24Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_24AssignVariableOpassignvariableop_24_resourcezeros_like_24:output:0*
_output_shapes
 *
dtype0Z
zeros_like_25Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_25AssignVariableOpassignvariableop_25_resourcezeros_like_25:output:0*
_output_shapes
 *
dtype0v
zeros_like_26/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_26/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_26Fill&zeros_like_26/shape_as_tensor:output:0zeros_like_26/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_26AssignVariableOpassignvariableop_26_resourcezeros_like_26:output:0*
_output_shapes
 *
dtype0Z
zeros_like_27Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_27AssignVariableOpassignvariableop_27_resourcezeros_like_27:output:0*
_output_shapes
 *
dtype0Z
zeros_like_28Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_28AssignVariableOpassignvariableop_28_resourcezeros_like_28:output:0*
_output_shapes
 *
dtype0v
zeros_like_29/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_29/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_29Fill&zeros_like_29/shape_as_tensor:output:0zeros_like_29/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_29AssignVariableOpassignvariableop_29_resourcezeros_like_29:output:0*
_output_shapes
 *
dtype0Z
zeros_like_30Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_30AssignVariableOpassignvariableop_30_resourcezeros_like_30:output:0*
_output_shapes
 *
dtype0Z
zeros_like_31Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_31AssignVariableOpassignvariableop_31_resourcezeros_like_31:output:0*
_output_shapes
 *
dtype0v
zeros_like_32/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"            X
zeros_like_32/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_32Fill&zeros_like_32/shape_as_tensor:output:0zeros_like_32/Const:output:0*
T0*&
_output_shapes
:
AssignVariableOp_32AssignVariableOpassignvariableop_32_resourcezeros_like_32:output:0*
_output_shapes
 *
dtype0Z
zeros_like_33Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_33AssignVariableOpassignvariableop_33_resourcezeros_like_33:output:0*
_output_shapes
 *
dtype0Z
zeros_like_34Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_34AssignVariableOpassignvariableop_34_resourcezeros_like_34:output:0*
_output_shapes
 *
dtype0n
zeros_like_35/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"À      X
zeros_like_35/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_35Fill&zeros_like_35/shape_as_tensor:output:0zeros_like_35/Const:output:0*
T0* 
_output_shapes
:
À
AssignVariableOp_35AssignVariableOpassignvariableop_35_resourcezeros_like_35:output:0*
_output_shapes
 *
dtype0h
zeros_like_36/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_36/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_36Fill&zeros_like_36/shape_as_tensor:output:0zeros_like_36/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_36AssignVariableOpassignvariableop_36_resourcezeros_like_36:output:0*
_output_shapes
 *
dtype0h
zeros_like_37/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB:X
zeros_like_37/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_37Fill&zeros_like_37/shape_as_tensor:output:0zeros_like_37/Const:output:0*
T0*
_output_shapes	
:
AssignVariableOp_37AssignVariableOpassignvariableop_37_resourcezeros_like_37:output:0*
_output_shapes
 *
dtype0n
zeros_like_38/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_38/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_38Fill&zeros_like_38/shape_as_tensor:output:0zeros_like_38/Const:output:0*
T0* 
_output_shapes
:

AssignVariableOp_38AssignVariableOpassignvariableop_38_resourcezeros_like_38:output:0*
_output_shapes
 *
dtype0\
zeros_like_39Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_39AssignVariableOpassignvariableop_39_resourcezeros_like_39:output:0*
_output_shapes
 *
dtype0\
zeros_like_40Const*
_output_shapes	
:*
dtype0*
valueB*    
AssignVariableOp_40AssignVariableOpassignvariableop_40_resourcezeros_like_40:output:0*
_output_shapes
 *
dtype0n
zeros_like_41/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"      X
zeros_like_41/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_41Fill&zeros_like_41/shape_as_tensor:output:0zeros_like_41/Const:output:0*
T0* 
_output_shapes
:
 
AssignVariableOp_41AssignVariableOpassignvariableop_41_resourcezeros_like_41:output:0*
_output_shapes
 *
dtype0h
zeros_like_42/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB: X
zeros_like_42/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zeros_like_42Fill&zeros_like_42/shape_as_tensor:output:0zeros_like_42/Const:output:0*
T0*
_output_shapes	
: 
AssignVariableOp_42AssignVariableOpassignvariableop_42_resourcezeros_like_42:output:0*
_output_shapes
 *
dtype0d
zeros_like_43Const*
_output_shapes
:	*
dtype0*
valueB	*    
AssignVariableOp_43AssignVariableOpassignvariableop_43_resourcezeros_like_43:output:0*
_output_shapes
 *
dtype0Z
zeros_like_44Const*
_output_shapes
:*
dtype0*
valueB*    
AssignVariableOp_44AssignVariableOpassignvariableop_44_resourcezeros_like_44:output:0*
_output_shapes
 *
dtype0E
IdentityIdentityoptions^NoOp*
T0*
_output_shapes
: 
NoOpNoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*o
_input_shapes^
\: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:? ;

_output_shapes
: 
!
_user_specified_name	options
®%
í
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4509

inputs6
'assignmovingavg_readvariableop_resource:	8
)assignmovingavg_1_readvariableop_resource:	4
%batchnorm_mul_readvariableop_resource:	0
!batchnorm_readvariableop_resource:	
identity¢AssignMovingAvg¢AssignMovingAvg/ReadVariableOp¢AssignMovingAvg_1¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(e
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	*
	keep_dims(n
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 t
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:y
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:¬
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
×#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:´
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:r
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:Q
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0u
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:d
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:w
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0q
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:s
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿê
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

|
&__inference_dense_2_layer_call_fn_6395

inputs
unknown:
À
identity¢StatefulPartitionedCallÊ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_4732p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿÀ: 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
 
_user_specified_nameinputs
Ø
¾
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4363

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢AssignNewValue¢AssignNewValue_1¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0Ö
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0º
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÔ
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ì
c
G__inference_activation_10_layer_call_and_return_conditional_losses_6492

inputs
identityE
EluEluinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityElu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ê

O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6263

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity¢FusedBatchNormV3/ReadVariableOp¢!FusedBatchNormV3/ReadVariableOp_1¢ReadVariableOp¢ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0È
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ°
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç
b
F__inference_activation_8_layer_call_and_return_conditional_losses_6291

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

|
&__inference_dense_3_layer_call_fn_6526

inputs
unknown:

identity¢StatefulPartitionedCallÊ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_3_layer_call_and_return_conditional_losses_4766p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ù	
b
C__inference_dropout_3_layer_call_and_return_conditional_losses_4942

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
G
+__inference_activation_8_layer_call_fn_6286

inputs
identity¹
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_8_layer_call_and_return_conditional_losses_4688h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¤ª
Ü
A__inference_model_1_layer_call_and_return_conditional_losses_5856

inputsA
'conv2d_4_conv2d_readvariableop_resource:;
-batch_normalization_6_readvariableop_resource:=
/batch_normalization_6_readvariableop_1_resource:L
>batch_normalization_6_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_5_conv2d_readvariableop_resource:;
-batch_normalization_7_readvariableop_resource:=
/batch_normalization_7_readvariableop_1_resource:L
>batch_normalization_7_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_6_conv2d_readvariableop_resource:;
-batch_normalization_8_readvariableop_resource:=
/batch_normalization_8_readvariableop_1_resource:L
>batch_normalization_8_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource:A
'conv2d_7_conv2d_readvariableop_resource:;
-batch_normalization_9_readvariableop_resource:=
/batch_normalization_9_readvariableop_1_resource:L
>batch_normalization_9_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource::
&dense_2_matmul_readvariableop_resource:
ÀG
8batch_normalization_10_batchnorm_readvariableop_resource:	K
<batch_normalization_10_batchnorm_mul_readvariableop_resource:	I
:batch_normalization_10_batchnorm_readvariableop_1_resource:	I
:batch_normalization_10_batchnorm_readvariableop_2_resource:	:
&dense_3_matmul_readvariableop_resource:
G
8batch_normalization_11_batchnorm_readvariableop_resource:	K
<batch_normalization_11_batchnorm_mul_readvariableop_resource:	I
:batch_normalization_11_batchnorm_readvariableop_1_resource:	I
:batch_normalization_11_batchnorm_readvariableop_2_resource:	3
 v_matmul_readvariableop_resource:	/
!v_biasadd_readvariableop_resource:5
!pi_matmul_readvariableop_resource:
 1
"pi_biasadd_readvariableop_resource:	 
identity

identity_1¢/batch_normalization_10/batchnorm/ReadVariableOp¢1batch_normalization_10/batchnorm/ReadVariableOp_1¢1batch_normalization_10/batchnorm/ReadVariableOp_2¢3batch_normalization_10/batchnorm/mul/ReadVariableOp¢/batch_normalization_11/batchnorm/ReadVariableOp¢1batch_normalization_11/batchnorm/ReadVariableOp_1¢1batch_normalization_11/batchnorm/ReadVariableOp_2¢3batch_normalization_11/batchnorm/mul/ReadVariableOp¢5batch_normalization_6/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_6/ReadVariableOp¢&batch_normalization_6/ReadVariableOp_1¢5batch_normalization_7/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_7/ReadVariableOp¢&batch_normalization_7/ReadVariableOp_1¢5batch_normalization_8/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_8/ReadVariableOp¢&batch_normalization_8/ReadVariableOp_1¢5batch_normalization_9/FusedBatchNormV3/ReadVariableOp¢7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1¢$batch_normalization_9/ReadVariableOp¢&batch_normalization_9/ReadVariableOp_1¢conv2d_4/Conv2D/ReadVariableOp¢conv2d_5/Conv2D/ReadVariableOp¢conv2d_6/Conv2D/ReadVariableOp¢conv2d_7/Conv2D/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢dense_3/MatMul/ReadVariableOp¢pi/BiasAdd/ReadVariableOp¢pi/MatMul/ReadVariableOp¢v/BiasAdd/ReadVariableOp¢v/MatMul/ReadVariableOp
conv2d_4/Conv2D/ReadVariableOpReadVariableOp'conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0«
conv2d_4/Conv2DConv2Dinputs&conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

$batch_normalization_6/ReadVariableOpReadVariableOp-batch_normalization_6_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_6/ReadVariableOp_1ReadVariableOp/batch_normalization_6_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_6/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_6_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_6_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0¶
&batch_normalization_6/FusedBatchNormV3FusedBatchNormV3conv2d_4/Conv2D:output:0,batch_normalization_6/ReadVariableOp:value:0.batch_normalization_6/ReadVariableOp_1:value:0=batch_normalization_6/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
activation_6/EluElu*batch_normalization_6/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_5/Conv2D/ReadVariableOpReadVariableOp'conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ã
conv2d_5/Conv2DConv2Dactivation_6/Elu:activations:0&conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingSAME*
strides

$batch_normalization_7/ReadVariableOpReadVariableOp-batch_normalization_7_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_7/ReadVariableOp_1ReadVariableOp/batch_normalization_7_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_7/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_7_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_7_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0¶
&batch_normalization_7/FusedBatchNormV3FusedBatchNormV3conv2d_5/Conv2D:output:0,batch_normalization_7/ReadVariableOp:value:0.batch_normalization_7/ReadVariableOp_1:value:0=batch_normalization_7/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
activation_7/EluElu*batch_normalization_7/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_6/Conv2D/ReadVariableOpReadVariableOp'conv2d_6_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ä
conv2d_6/Conv2DConv2Dactivation_7/Elu:activations:0&conv2d_6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

$batch_normalization_8/ReadVariableOpReadVariableOp-batch_normalization_8_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_8/ReadVariableOp_1ReadVariableOp/batch_normalization_8_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_8/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_8_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_8_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0¶
&batch_normalization_8/FusedBatchNormV3FusedBatchNormV3conv2d_6/Conv2D:output:0,batch_normalization_8/ReadVariableOp:value:0.batch_normalization_8/ReadVariableOp_1:value:0=batch_normalization_8/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
activation_8/EluElu*batch_normalization_8/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
conv2d_7/Conv2D/ReadVariableOpReadVariableOp'conv2d_7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ä
conv2d_7/Conv2DConv2Dactivation_8/Elu:activations:0&conv2d_7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
paddingVALID*
strides

$batch_normalization_9/ReadVariableOpReadVariableOp-batch_normalization_9_readvariableop_resource*
_output_shapes
:*
dtype0
&batch_normalization_9/ReadVariableOp_1ReadVariableOp/batch_normalization_9_readvariableop_1_resource*
_output_shapes
:*
dtype0°
5batch_normalization_9/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_9_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0´
7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_9_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0¶
&batch_normalization_9/FusedBatchNormV3FusedBatchNormV3conv2d_7/Conv2D:output:0,batch_normalization_9/ReadVariableOp:value:0.batch_normalization_9/ReadVariableOp_1:value:0=batch_normalization_9/FusedBatchNormV3/ReadVariableOp:value:0?batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:ÿÿÿÿÿÿÿÿÿ:::::*
epsilon%o:*
is_training( }
activation_9/EluElu*batch_normalization_9/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿÀ   
flatten_1/ReshapeReshapeactivation_9/Elu:activations:0flatten_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0
dense_2/MatMulMatMulflatten_1/Reshape:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¥
/batch_normalization_10/batchnorm/ReadVariableOpReadVariableOp8batch_normalization_10_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0k
&batch_normalization_10/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:½
$batch_normalization_10/batchnorm/addAddV27batch_normalization_10/batchnorm/ReadVariableOp:value:0/batch_normalization_10/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
&batch_normalization_10/batchnorm/RsqrtRsqrt(batch_normalization_10/batchnorm/add:z:0*
T0*
_output_shapes	
:­
3batch_normalization_10/batchnorm/mul/ReadVariableOpReadVariableOp<batch_normalization_10_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0º
$batch_normalization_10/batchnorm/mulMul*batch_normalization_10/batchnorm/Rsqrt:y:0;batch_normalization_10/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¤
&batch_normalization_10/batchnorm/mul_1Muldense_2/MatMul:product:0(batch_normalization_10/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ©
1batch_normalization_10/batchnorm/ReadVariableOp_1ReadVariableOp:batch_normalization_10_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0¸
&batch_normalization_10/batchnorm/mul_2Mul9batch_normalization_10/batchnorm/ReadVariableOp_1:value:0(batch_normalization_10/batchnorm/mul:z:0*
T0*
_output_shapes	
:©
1batch_normalization_10/batchnorm/ReadVariableOp_2ReadVariableOp:batch_normalization_10_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0¸
$batch_normalization_10/batchnorm/subSub9batch_normalization_10/batchnorm/ReadVariableOp_2:value:0*batch_normalization_10/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:¸
&batch_normalization_10/batchnorm/add_1AddV2*batch_normalization_10/batchnorm/mul_1:z:0(batch_normalization_10/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
activation_10/EluElu*batch_normalization_10/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
dropout_2/IdentityIdentityactivation_10/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_3/MatMulMatMuldropout_2/Identity:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¥
/batch_normalization_11/batchnorm/ReadVariableOpReadVariableOp8batch_normalization_11_batchnorm_readvariableop_resource*
_output_shapes	
:*
dtype0k
&batch_normalization_11/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:½
$batch_normalization_11/batchnorm/addAddV27batch_normalization_11/batchnorm/ReadVariableOp:value:0/batch_normalization_11/batchnorm/add/y:output:0*
T0*
_output_shapes	
:
&batch_normalization_11/batchnorm/RsqrtRsqrt(batch_normalization_11/batchnorm/add:z:0*
T0*
_output_shapes	
:­
3batch_normalization_11/batchnorm/mul/ReadVariableOpReadVariableOp<batch_normalization_11_batchnorm_mul_readvariableop_resource*
_output_shapes	
:*
dtype0º
$batch_normalization_11/batchnorm/mulMul*batch_normalization_11/batchnorm/Rsqrt:y:0;batch_normalization_11/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:¤
&batch_normalization_11/batchnorm/mul_1Muldense_3/MatMul:product:0(batch_normalization_11/batchnorm/mul:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ©
1batch_normalization_11/batchnorm/ReadVariableOp_1ReadVariableOp:batch_normalization_11_batchnorm_readvariableop_1_resource*
_output_shapes	
:*
dtype0¸
&batch_normalization_11/batchnorm/mul_2Mul9batch_normalization_11/batchnorm/ReadVariableOp_1:value:0(batch_normalization_11/batchnorm/mul:z:0*
T0*
_output_shapes	
:©
1batch_normalization_11/batchnorm/ReadVariableOp_2ReadVariableOp:batch_normalization_11_batchnorm_readvariableop_2_resource*
_output_shapes	
:*
dtype0¸
$batch_normalization_11/batchnorm/subSub9batch_normalization_11/batchnorm/ReadVariableOp_2:value:0*batch_normalization_11/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:¸
&batch_normalization_11/batchnorm/add_1AddV2*batch_normalization_11/batchnorm/mul_1:z:0(batch_normalization_11/batchnorm/sub:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
activation_11/EluElu*batch_normalization_11/batchnorm/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
dropout_3/IdentityIdentityactivation_11/Elu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
v/MatMul/ReadVariableOpReadVariableOp v_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
v/MatMulMatMuldropout_3/Identity:output:0v/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
v/BiasAdd/ReadVariableOpReadVariableOp!v_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0|
	v/BiasAddBiasAddv/MatMul:product:0 v/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
v/TanhTanhv/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
pi/MatMul/ReadVariableOpReadVariableOp!pi_matmul_readvariableop_resource* 
_output_shapes
:
 *
dtype0
	pi/MatMulMatMuldropout_3/Identity:output:0 pi/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ y
pi/BiasAdd/ReadVariableOpReadVariableOp"pi_biasadd_readvariableop_resource*
_output_shapes	
: *
dtype0

pi/BiasAddBiasAddpi/MatMul:product:0!pi/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ ]

pi/SoftmaxSoftmaxpi/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ d
IdentityIdentitypi/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ [

Identity_1Identity
v/Tanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp0^batch_normalization_10/batchnorm/ReadVariableOp2^batch_normalization_10/batchnorm/ReadVariableOp_12^batch_normalization_10/batchnorm/ReadVariableOp_24^batch_normalization_10/batchnorm/mul/ReadVariableOp0^batch_normalization_11/batchnorm/ReadVariableOp2^batch_normalization_11/batchnorm/ReadVariableOp_12^batch_normalization_11/batchnorm/ReadVariableOp_24^batch_normalization_11/batchnorm/mul/ReadVariableOp6^batch_normalization_6/FusedBatchNormV3/ReadVariableOp8^batch_normalization_6/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_6/ReadVariableOp'^batch_normalization_6/ReadVariableOp_16^batch_normalization_7/FusedBatchNormV3/ReadVariableOp8^batch_normalization_7/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_7/ReadVariableOp'^batch_normalization_7/ReadVariableOp_16^batch_normalization_8/FusedBatchNormV3/ReadVariableOp8^batch_normalization_8/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_8/ReadVariableOp'^batch_normalization_8/ReadVariableOp_16^batch_normalization_9/FusedBatchNormV3/ReadVariableOp8^batch_normalization_9/FusedBatchNormV3/ReadVariableOp_1%^batch_normalization_9/ReadVariableOp'^batch_normalization_9/ReadVariableOp_1^conv2d_4/Conv2D/ReadVariableOp^conv2d_5/Conv2D/ReadVariableOp^conv2d_6/Conv2D/ReadVariableOp^conv2d_7/Conv2D/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/MatMul/ReadVariableOp^pi/BiasAdd/ReadVariableOp^pi/MatMul/ReadVariableOp^v/BiasAdd/ReadVariableOp^v/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2b
/batch_normalization_10/batchnorm/ReadVariableOp/batch_normalization_10/batchnorm/ReadVariableOp2f
1batch_normalization_10/batchnorm/ReadVariableOp_11batch_normalization_10/batchnorm/ReadVariableOp_12f
1batch_normalization_10/batchnorm/ReadVariableOp_21batch_normalization_10/batchnorm/ReadVariableOp_22j
3batch_normalization_10/batchnorm/mul/ReadVariableOp3batch_normalization_10/batchnorm/mul/ReadVariableOp2b
/batch_normalization_11/batchnorm/ReadVariableOp/batch_normalization_11/batchnorm/ReadVariableOp2f
1batch_normalization_11/batchnorm/ReadVariableOp_11batch_normalization_11/batchnorm/ReadVariableOp_12f
1batch_normalization_11/batchnorm/ReadVariableOp_21batch_normalization_11/batchnorm/ReadVariableOp_22j
3batch_normalization_11/batchnorm/mul/ReadVariableOp3batch_normalization_11/batchnorm/mul/ReadVariableOp2n
5batch_normalization_6/FusedBatchNormV3/ReadVariableOp5batch_normalization_6/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_6/FusedBatchNormV3/ReadVariableOp_17batch_normalization_6/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_6/ReadVariableOp$batch_normalization_6/ReadVariableOp2P
&batch_normalization_6/ReadVariableOp_1&batch_normalization_6/ReadVariableOp_12n
5batch_normalization_7/FusedBatchNormV3/ReadVariableOp5batch_normalization_7/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_7/FusedBatchNormV3/ReadVariableOp_17batch_normalization_7/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_7/ReadVariableOp$batch_normalization_7/ReadVariableOp2P
&batch_normalization_7/ReadVariableOp_1&batch_normalization_7/ReadVariableOp_12n
5batch_normalization_8/FusedBatchNormV3/ReadVariableOp5batch_normalization_8/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_8/FusedBatchNormV3/ReadVariableOp_17batch_normalization_8/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_8/ReadVariableOp$batch_normalization_8/ReadVariableOp2P
&batch_normalization_8/ReadVariableOp_1&batch_normalization_8/ReadVariableOp_12n
5batch_normalization_9/FusedBatchNormV3/ReadVariableOp5batch_normalization_9/FusedBatchNormV3/ReadVariableOp2r
7batch_normalization_9/FusedBatchNormV3/ReadVariableOp_17batch_normalization_9/FusedBatchNormV3/ReadVariableOp_12L
$batch_normalization_9/ReadVariableOp$batch_normalization_9/ReadVariableOp2P
&batch_normalization_9/ReadVariableOp_1&batch_normalization_9/ReadVariableOp_12@
conv2d_4/Conv2D/ReadVariableOpconv2d_4/Conv2D/ReadVariableOp2@
conv2d_5/Conv2D/ReadVariableOpconv2d_5/Conv2D/ReadVariableOp2@
conv2d_6/Conv2D/ReadVariableOpconv2d_6/Conv2D/ReadVariableOp2@
conv2d_7/Conv2D/ReadVariableOpconv2d_7/Conv2D/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp26
pi/BiasAdd/ReadVariableOppi/BiasAdd/ReadVariableOp24
pi/MatMul/ReadVariableOppi/MatMul/ReadVariableOp24
v/BiasAdd/ReadVariableOpv/BiasAdd/ReadVariableOp22
v/MatMul/ReadVariableOpv/MatMul/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ú
a
C__inference_dropout_2_layer_call_and_return_conditional_losses_4757

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
n
²
A__inference_model_1_layer_call_and_return_conditional_losses_5571
input_2'
conv2d_4_5478:(
batch_normalization_6_5481:(
batch_normalization_6_5483:(
batch_normalization_6_5485:(
batch_normalization_6_5487:'
conv2d_5_5491:(
batch_normalization_7_5494:(
batch_normalization_7_5496:(
batch_normalization_7_5498:(
batch_normalization_7_5500:'
conv2d_6_5504:(
batch_normalization_8_5507:(
batch_normalization_8_5509:(
batch_normalization_8_5511:(
batch_normalization_8_5513:'
conv2d_7_5517:(
batch_normalization_9_5520:(
batch_normalization_9_5522:(
batch_normalization_9_5524:(
batch_normalization_9_5526: 
dense_2_5531:
À*
batch_normalization_10_5534:	*
batch_normalization_10_5536:	*
batch_normalization_10_5538:	*
batch_normalization_10_5540:	 
dense_3_5545:
*
batch_normalization_11_5548:	*
batch_normalization_11_5550:	*
batch_normalization_11_5552:	*
batch_normalization_11_5554:	
v_5559:	
v_5561:
pi_5564:
 
pi_5566:	 
identity

identity_1¢.batch_normalization_10/StatefulPartitionedCall¢.batch_normalization_11/StatefulPartitionedCall¢-batch_normalization_6/StatefulPartitionedCall¢-batch_normalization_7/StatefulPartitionedCall¢-batch_normalization_8/StatefulPartitionedCall¢-batch_normalization_9/StatefulPartitionedCall¢ conv2d_4/StatefulPartitionedCall¢ conv2d_5/StatefulPartitionedCall¢ conv2d_6/StatefulPartitionedCall¢ conv2d_7/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢!dropout_2/StatefulPartitionedCall¢!dropout_3/StatefulPartitionedCall¢pi/StatefulPartitionedCall¢v/StatefulPartitionedCallâ
 conv2d_4/StatefulPartitionedCallStatefulPartitionedCallinput_2conv2d_4_5478*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_4_layer_call_and_return_conditional_losses_4616
-batch_normalization_6/StatefulPartitionedCallStatefulPartitionedCall)conv2d_4/StatefulPartitionedCall:output:0batch_normalization_6_5481batch_normalization_6_5483batch_normalization_6_5485batch_normalization_6_5487*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_4235ö
activation_6/PartitionedCallPartitionedCall6batch_normalization_6/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_6_layer_call_and_return_conditional_losses_4634
 conv2d_5/StatefulPartitionedCallStatefulPartitionedCall%activation_6/PartitionedCall:output:0conv2d_5_5491*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_5_layer_call_and_return_conditional_losses_4643
-batch_normalization_7/StatefulPartitionedCallStatefulPartitionedCall)conv2d_5/StatefulPartitionedCall:output:0batch_normalization_7_5494batch_normalization_7_5496batch_normalization_7_5498batch_normalization_7_5500*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_4299ö
activation_7/PartitionedCallPartitionedCall6batch_normalization_7/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_7_layer_call_and_return_conditional_losses_4661
 conv2d_6/StatefulPartitionedCallStatefulPartitionedCall%activation_7/PartitionedCall:output:0conv2d_6_5504*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_6_layer_call_and_return_conditional_losses_4670
-batch_normalization_8/StatefulPartitionedCallStatefulPartitionedCall)conv2d_6/StatefulPartitionedCall:output:0batch_normalization_8_5507batch_normalization_8_5509batch_normalization_8_5511batch_normalization_8_5513*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_4363ö
activation_8/PartitionedCallPartitionedCall6batch_normalization_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_8_layer_call_and_return_conditional_losses_4688
 conv2d_7/StatefulPartitionedCallStatefulPartitionedCall%activation_8/PartitionedCall:output:0conv2d_7_5517*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_conv2d_7_layer_call_and_return_conditional_losses_4697
-batch_normalization_9/StatefulPartitionedCallStatefulPartitionedCall)conv2d_7/StatefulPartitionedCall:output:0batch_normalization_9_5520batch_normalization_9_5522batch_normalization_9_5524batch_normalization_9_5526*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_4427ö
activation_9/PartitionedCallPartitionedCall6batch_normalization_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_activation_9_layer_call_and_return_conditional_losses_4715Ø
flatten_1/PartitionedCallPartitionedCall%activation_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_flatten_1_layer_call_and_return_conditional_losses_4723ó
dense_2/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_2_5531*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_4732
.batch_normalization_10/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0batch_normalization_10_5534batch_normalization_10_5536batch_normalization_10_5538batch_normalization_10_5540*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_4509ò
activation_10/PartitionedCallPartitionedCall7batch_normalization_10/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_10_layer_call_and_return_conditional_losses_4750é
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall&activation_10/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_4979û
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_3_5545*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_3_layer_call_and_return_conditional_losses_4766
.batch_normalization_11/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0batch_normalization_11_5548batch_normalization_11_5550batch_normalization_11_5552batch_normalization_11_5554*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4591ò
activation_11/PartitionedCallPartitionedCall7batch_normalization_11/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_activation_11_layer_call_and_return_conditional_losses_4784
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall&activation_11/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_4942ò
v/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0v_5559v_5561*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *D
f?R=
;__inference_v_layer_call_and_return_conditional_losses_4804÷
pi/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0pi_5564pi_5566*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *E
f@R>
<__inference_pi_layer_call_and_return_conditional_losses_4821s
IdentityIdentity#pi/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ s

Identity_1Identity"v/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
NoOpNoOp/^batch_normalization_10/StatefulPartitionedCall/^batch_normalization_11/StatefulPartitionedCall.^batch_normalization_6/StatefulPartitionedCall.^batch_normalization_7/StatefulPartitionedCall.^batch_normalization_8/StatefulPartitionedCall.^batch_normalization_9/StatefulPartitionedCall!^conv2d_4/StatefulPartitionedCall!^conv2d_5/StatefulPartitionedCall!^conv2d_6/StatefulPartitionedCall!^conv2d_7/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall^pi/StatefulPartitionedCall^v/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_10/StatefulPartitionedCall.batch_normalization_10/StatefulPartitionedCall2`
.batch_normalization_11/StatefulPartitionedCall.batch_normalization_11/StatefulPartitionedCall2^
-batch_normalization_6/StatefulPartitionedCall-batch_normalization_6/StatefulPartitionedCall2^
-batch_normalization_7/StatefulPartitionedCall-batch_normalization_7/StatefulPartitionedCall2^
-batch_normalization_8/StatefulPartitionedCall-batch_normalization_8/StatefulPartitionedCall2^
-batch_normalization_9/StatefulPartitionedCall-batch_normalization_9/StatefulPartitionedCall2D
 conv2d_4/StatefulPartitionedCall conv2d_4/StatefulPartitionedCall2D
 conv2d_5/StatefulPartitionedCall conv2d_5/StatefulPartitionedCall2D
 conv2d_6/StatefulPartitionedCall conv2d_6/StatefulPartitionedCall2D
 conv2d_7/StatefulPartitionedCall conv2d_7/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall28
pi/StatefulPartitionedCallpi/StatefulPartitionedCall26
v/StatefulPartitionedCallv/StatefulPartitionedCall:X T
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
!
_user_specified_name	input_2
¬
Ô
5__inference_batch_normalization_11_layer_call_fn_6559

inputs
unknown:	
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity¢StatefulPartitionedCallþ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *Y
fTRR
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_4591p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ö
¦
&__inference_model_1_layer_call_fn_5721

inputs!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:#
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:

unknown_11:

unknown_12:

unknown_13:$

unknown_14:

unknown_15:

unknown_16:

unknown_17:

unknown_18:

unknown_19:
À

unknown_20:	

unknown_21:	

unknown_22:	

unknown_23:	

unknown_24:


unknown_25:	

unknown_26:	

unknown_27:	

unknown_28:	

unknown_29:	

unknown_30:

unknown_31:
 

unknown_32:	 
identity

identity_1¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32*.
Tin'
%2#*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':ÿÿÿÿÿÿÿÿÿ :ÿÿÿÿÿÿÿÿÿ*8
_read_only_resource_inputs
 !"*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_5231p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*r
_input_shapesa
_:ÿÿÿÿÿÿÿÿÿ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs


í
;__inference_v_layer_call_and_return_conditional_losses_6690

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ë
¬
A__inference_dense_2_layer_call_and_return_conditional_losses_6402

inputs2
matmul_readvariableop_resource:
À
identity¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
À*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
IdentityIdentityMatMul:product:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
NoOpNoOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:ÿÿÿÿÿÿÿÿÿÀ: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
 
_user_specified_nameinputs
ç
b
F__inference_activation_8_layer_call_and_return_conditional_losses_4688

inputs
identityL
EluEluinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
IdentityIdentityElu:activations:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs8
!__inference_internal_grad_fn_7016CustomGradient-20228
!__inference_internal_grad_fn_7152CustomGradient-3891"ÛL
saver_filename:0StatefulPartitionedCall_5:0StatefulPartitionedCall_68"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*
chessnet_reset_optimizer~
3
options(
"chessnet_reset_optimizer_options:0 +
output_0
StatefulPartitionedCall:0 tensorflow/serving/predict*
chessnet_save_checkpointz
-
path%
chessnet_save_checkpoint_path:0 -
output_0!
StatefulPartitionedCall_1:0 tensorflow/serving/predict*è
chessnet_serveÕ
6
x1
chessnet_serve_x:0ÿÿÿÿÿÿÿÿÿ?
output_03
StatefulPartitionedCall_2:0ÿÿÿÿÿÿÿÿÿ >
output_12
StatefulPartitionedCall_2:1ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict*Ó
chessnet_trainÀ
1
pi+
chessnet_train_pi:0ÿÿÿÿÿÿÿÿÿ 
*
v%
chessnet_train_v:0ÿÿÿÿÿÿÿÿÿ
6
x1
chessnet_train_x:0ÿÿÿÿÿÿÿÿÿ-
output_0!
StatefulPartitionedCall_3:0 -
output_1!
StatefulPartitionedCall_3:1 -
output_2!
StatefulPartitionedCall_3:2 tensorflow/serving/predict*ß
chessnet_validateÉ
4
pi.
chessnet_validate_pi:0ÿÿÿÿÿÿÿÿÿ 
-
v(
chessnet_validate_v:0ÿÿÿÿÿÿÿÿÿ
9
x4
chessnet_validate_x:0ÿÿÿÿÿÿÿÿÿ-
output_0!
StatefulPartitionedCall_4:0 -
output_1!
StatefulPartitionedCall_4:1 -
output_2!
StatefulPartitionedCall_4:2 tensorflow/serving/predict:ºÓ
³
	model
	optimizer

checkpoint
__call__
reset_optimizer
save_checkpoint

train_step
validate_step
	
signatures"
_generic_user_object
3
	
model
	keras_api"
_tf_keras_model
£
iter

beta_1

beta_2
	decay
learning_rate5má=mâ>mãMmäUmåVmæemçmmènmé}mê	më	mì	mí	£mî	¤mï	ºmð	Âmñ	Ãmò	Ùmó	Úmô	ámõ	âmö5v÷=vø>vùMvúUvûVvüevýmvþnvÿ}v	v	v	v	£v	¤v	ºv	Âv	Ãv	Ùv	Úv	áv	âv"
	optimizer
:
root
save_counter"
_generic_user_object
á2Þ
__inference___call___3246À
²
FullArgSpec
args
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *%¢"
 ÿÿÿÿÿÿÿÿÿ
Õ2Ò
 __inference_reset_optimizer_3376­
²
FullArgSpec
args
jself
	joptions
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *¢	
 
Ò2Ï
 __inference_save_checkpoint_3533ª
²
FullArgSpec
args
jself
jpath
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *¢	
 
2
__inference_train_step_4028ü
²
FullArgSpec#
args
jself
jx
jpi
jv
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *V¢S
 ÿÿÿÿÿÿÿÿÿ
ÿÿÿÿÿÿÿÿÿ 
ÿÿÿÿÿÿÿÿÿ
¢2
__inference_validate_step_4179ü
²
FullArgSpec#
args
jself
jx
jpi
jv
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *V¢S
 ÿÿÿÿÿÿÿÿÿ
ÿÿÿÿÿÿÿÿÿ 
ÿÿÿÿÿÿÿÿÿ

chessnet_serve
chessnet_train
chessnet_validate
chessnet_save_checkpoint
chessnet_reset_optimizer"
signature_map
Ý
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer_with_weights-4
layer-7
layer_with_weights-5
layer-8
 layer-9
!layer_with_weights-6
!layer-10
"layer_with_weights-7
"layer-11
#layer-12
$layer-13
%layer_with_weights-8
%layer-14
&layer_with_weights-9
&layer-15
'layer-16
(layer-17
)layer_with_weights-10
)layer-18
*layer_with_weights-11
*layer-19
+layer-20
,layer-21
-layer_with_weights-12
-layer-22
.layer_with_weights-13
.layer-23
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses"
_tf_keras_network
"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
:	 2save_counter
ÃBÀ
"__inference_signature_wrapper_2677x"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÈBÅ
"__inference_signature_wrapper_2856pivx"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÈBÅ
"__inference_signature_wrapper_2939pivx"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÆBÃ
"__inference_signature_wrapper_3014path"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÉBÆ
"__inference_signature_wrapper_3111options"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
"
_tf_keras_input_layer
±

5kernel
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses"
_tf_keras_layer
ê
<axis
	=gamma
>beta
?moving_mean
@moving_variance
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
E__call__
*F&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
K__call__
*L&call_and_return_all_conditional_losses"
_tf_keras_layer
±

Mkernel
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses"
_tf_keras_layer
ê
Taxis
	Ugamma
Vbeta
Wmoving_mean
Xmoving_variance
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
]__call__
*^&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
_	variables
`trainable_variables
aregularization_losses
b	keras_api
c__call__
*d&call_and_return_all_conditional_losses"
_tf_keras_layer
±

ekernel
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses"
_tf_keras_layer
ê
laxis
	mgamma
nbeta
omoving_mean
pmoving_variance
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses"
_tf_keras_layer
µ

}kernel
~	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
õ
	axis

gamma
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
«
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
«
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
kernel
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
+¡&call_and_return_all_conditional_losses"
_tf_keras_layer
õ
	¢axis

£gamma
	¤beta
¥moving_mean
¦moving_variance
§	variables
¨trainable_variables
©regularization_losses
ª	keras_api
«__call__
+¬&call_and_return_all_conditional_losses"
_tf_keras_layer
«
­	variables
®trainable_variables
¯regularization_losses
°	keras_api
±__call__
+²&call_and_return_all_conditional_losses"
_tf_keras_layer
Ã
³	variables
´trainable_variables
µregularization_losses
¶	keras_api
·_random_generator
¸__call__
+¹&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
ºkernel
»	variables
¼trainable_variables
½regularization_losses
¾	keras_api
¿__call__
+À&call_and_return_all_conditional_losses"
_tf_keras_layer
õ
	Áaxis

Âgamma
	Ãbeta
Ämoving_mean
Åmoving_variance
Æ	variables
Çtrainable_variables
Èregularization_losses
É	keras_api
Ê__call__
+Ë&call_and_return_all_conditional_losses"
_tf_keras_layer
«
Ì	variables
Ítrainable_variables
Îregularization_losses
Ï	keras_api
Ð__call__
+Ñ&call_and_return_all_conditional_losses"
_tf_keras_layer
Ã
Ò	variables
Ótrainable_variables
Ôregularization_losses
Õ	keras_api
Ö_random_generator
×__call__
+Ø&call_and_return_all_conditional_losses"
_tf_keras_layer
Ã
Ùkernel
	Úbias
Û	variables
Ütrainable_variables
Ýregularization_losses
Þ	keras_api
ß__call__
+à&call_and_return_all_conditional_losses"
_tf_keras_layer
Ã
ákernel
	âbias
ã	variables
ätrainable_variables
åregularization_losses
æ	keras_api
ç__call__
+è&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
50
=1
>2
?3
@4
M5
U6
V7
W8
X9
e10
m11
n12
o13
p14
}15
16
17
18
19
20
£21
¤22
¥23
¦24
º25
Â26
Ã27
Ä28
Å29
Ù30
Ú31
á32
â33"
trackable_list_wrapper
Ò
50
=1
>2
M3
U4
V5
e6
m7
n8
}9
10
11
12
£13
¤14
º15
Â16
Ã17
Ù18
Ú19
á20
â21"
trackable_list_wrapper
 "
trackable_list_wrapper
²
énon_trainable_variables
êlayers
ëmetrics
 ìlayer_regularization_losses
ílayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
æ2ã
&__inference_model_1_layer_call_fn_4902
&__inference_model_1_layer_call_fn_5646
&__inference_model_1_layer_call_fn_5721
&__inference_model_1_layer_call_fn_5379À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ò2Ï
A__inference_model_1_layer_call_and_return_conditional_losses_5856
A__inference_model_1_layer_call_and_return_conditional_losses_6033
A__inference_model_1_layer_call_and_return_conditional_losses_5475
A__inference_model_1_layer_call_and_return_conditional_losses_5571À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
):'2conv2d_4/kernel
'
50"
trackable_list_wrapper
'
50"
trackable_list_wrapper
 "
trackable_list_wrapper
²
înon_trainable_variables
ïlayers
ðmetrics
 ñlayer_regularization_losses
òlayer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses"
_generic_user_object
Ñ2Î
'__inference_conv2d_4_layer_call_fn_6040¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_conv2d_4_layer_call_and_return_conditional_losses_6047¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
):'2batch_normalization_6/gamma
(:&2batch_normalization_6/beta
1:/ (2!batch_normalization_6/moving_mean
5:3 (2%batch_normalization_6/moving_variance
<
=0
>1
?2
@3"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
ónon_trainable_variables
ôlayers
õmetrics
 ölayer_regularization_losses
÷layer_metrics
A	variables
Btrainable_variables
Cregularization_losses
E__call__
*F&call_and_return_all_conditional_losses
&F"call_and_return_conditional_losses"
_generic_user_object
¦2£
4__inference_batch_normalization_6_layer_call_fn_6060
4__inference_batch_normalization_6_layer_call_fn_6073´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ü2Ù
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6091
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6109´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
ønon_trainable_variables
ùlayers
úmetrics
 ûlayer_regularization_losses
ülayer_metrics
G	variables
Htrainable_variables
Iregularization_losses
K__call__
*L&call_and_return_all_conditional_losses
&L"call_and_return_conditional_losses"
_generic_user_object
Õ2Ò
+__inference_activation_6_layer_call_fn_6114¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_activation_6_layer_call_and_return_conditional_losses_6119¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
):'2conv2d_5/kernel
'
M0"
trackable_list_wrapper
'
M0"
trackable_list_wrapper
 "
trackable_list_wrapper
²
ýnon_trainable_variables
þlayers
ÿmetrics
 layer_regularization_losses
layer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses"
_generic_user_object
Ñ2Î
'__inference_conv2d_5_layer_call_fn_6126¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_conv2d_5_layer_call_and_return_conditional_losses_6133¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
):'2batch_normalization_7/gamma
(:&2batch_normalization_7/beta
1:/ (2!batch_normalization_7/moving_mean
5:3 (2%batch_normalization_7/moving_variance
<
U0
V1
W2
X3"
trackable_list_wrapper
.
U0
V1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Y	variables
Ztrainable_variables
[regularization_losses
]__call__
*^&call_and_return_all_conditional_losses
&^"call_and_return_conditional_losses"
_generic_user_object
¦2£
4__inference_batch_normalization_7_layer_call_fn_6146
4__inference_batch_normalization_7_layer_call_fn_6159´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ü2Ù
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6177
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6195´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
_	variables
`trainable_variables
aregularization_losses
c__call__
*d&call_and_return_all_conditional_losses
&d"call_and_return_conditional_losses"
_generic_user_object
Õ2Ò
+__inference_activation_7_layer_call_fn_6200¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_activation_7_layer_call_and_return_conditional_losses_6205¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
):'2conv2d_6/kernel
'
e0"
trackable_list_wrapper
'
e0"
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses"
_generic_user_object
Ñ2Î
'__inference_conv2d_6_layer_call_fn_6212¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_conv2d_6_layer_call_and_return_conditional_losses_6219¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
):'2batch_normalization_8/gamma
(:&2batch_normalization_8/beta
1:/ (2!batch_normalization_8/moving_mean
5:3 (2%batch_normalization_8/moving_variance
<
m0
n1
o2
p3"
trackable_list_wrapper
.
m0
n1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
¦2£
4__inference_batch_normalization_8_layer_call_fn_6232
4__inference_batch_normalization_8_layer_call_fn_6245´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ü2Ù
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6263
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6281´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses"
_generic_user_object
Õ2Ò
+__inference_activation_8_layer_call_fn_6286¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_activation_8_layer_call_and_return_conditional_losses_6291¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
):'2conv2d_7/kernel
'
}0"
trackable_list_wrapper
'
}0"
trackable_list_wrapper
 "
trackable_list_wrapper
¶
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
~	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
Ñ2Î
'__inference_conv2d_7_layer_call_fn_6298¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_conv2d_7_layer_call_and_return_conditional_losses_6305¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
):'2batch_normalization_9/gamma
(:&2batch_normalization_9/beta
1:/ (2!batch_normalization_9/moving_mean
5:3 (2%batch_normalization_9/moving_variance
@
0
1
2
3"
trackable_list_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
 non_trainable_variables
¡layers
¢metrics
 £layer_regularization_losses
¤layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
¦2£
4__inference_batch_normalization_9_layer_call_fn_6318
4__inference_batch_normalization_9_layer_call_fn_6331´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ü2Ù
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6349
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6367´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
¥non_trainable_variables
¦layers
§metrics
 ¨layer_regularization_losses
©layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
Õ2Ò
+__inference_activation_9_layer_call_fn_6372¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_activation_9_layer_call_and_return_conditional_losses_6377¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ªnon_trainable_variables
«layers
¬metrics
 ­layer_regularization_losses
®layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
Ò2Ï
(__inference_flatten_1_layer_call_fn_6382¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
í2ê
C__inference_flatten_1_layer_call_and_return_conditional_losses_6388¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
": 
À2dense_2/kernel
(
0"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
¯non_trainable_variables
°layers
±metrics
 ²layer_regularization_losses
³layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
+¡&call_and_return_all_conditional_losses
'¡"call_and_return_conditional_losses"
_generic_user_object
Ð2Í
&__inference_dense_2_layer_call_fn_6395¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ë2è
A__inference_dense_2_layer_call_and_return_conditional_losses_6402¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
+:)2batch_normalization_10/gamma
*:(2batch_normalization_10/beta
3:1 (2"batch_normalization_10/moving_mean
7:5 (2&batch_normalization_10/moving_variance
@
£0
¤1
¥2
¦3"
trackable_list_wrapper
0
£0
¤1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
´non_trainable_variables
µlayers
¶metrics
 ·layer_regularization_losses
¸layer_metrics
§	variables
¨trainable_variables
©regularization_losses
«__call__
+¬&call_and_return_all_conditional_losses
'¬"call_and_return_conditional_losses"
_generic_user_object
¨2¥
5__inference_batch_normalization_10_layer_call_fn_6415
5__inference_batch_normalization_10_layer_call_fn_6428´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Þ2Û
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6448
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6482´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
¹non_trainable_variables
ºlayers
»metrics
 ¼layer_regularization_losses
½layer_metrics
­	variables
®trainable_variables
¯regularization_losses
±__call__
+²&call_and_return_all_conditional_losses
'²"call_and_return_conditional_losses"
_generic_user_object
Ö2Ó
,__inference_activation_10_layer_call_fn_6487¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ñ2î
G__inference_activation_10_layer_call_and_return_conditional_losses_6492¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
¾non_trainable_variables
¿layers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
³	variables
´trainable_variables
µregularization_losses
¸__call__
+¹&call_and_return_all_conditional_losses
'¹"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
(__inference_dropout_2_layer_call_fn_6497
(__inference_dropout_2_layer_call_fn_6502´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ä2Á
C__inference_dropout_2_layer_call_and_return_conditional_losses_6507
C__inference_dropout_2_layer_call_and_return_conditional_losses_6519´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
": 
2dense_3/kernel
(
º0"
trackable_list_wrapper
(
º0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ãnon_trainable_variables
Älayers
Åmetrics
 Ælayer_regularization_losses
Çlayer_metrics
»	variables
¼trainable_variables
½regularization_losses
¿__call__
+À&call_and_return_all_conditional_losses
'À"call_and_return_conditional_losses"
_generic_user_object
Ð2Í
&__inference_dense_3_layer_call_fn_6526¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ë2è
A__inference_dense_3_layer_call_and_return_conditional_losses_6533¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
+:)2batch_normalization_11/gamma
*:(2batch_normalization_11/beta
3:1 (2"batch_normalization_11/moving_mean
7:5 (2&batch_normalization_11/moving_variance
@
Â0
Ã1
Ä2
Å3"
trackable_list_wrapper
0
Â0
Ã1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ènon_trainable_variables
Élayers
Êmetrics
 Ëlayer_regularization_losses
Ìlayer_metrics
Æ	variables
Çtrainable_variables
Èregularization_losses
Ê__call__
+Ë&call_and_return_all_conditional_losses
'Ë"call_and_return_conditional_losses"
_generic_user_object
¨2¥
5__inference_batch_normalization_11_layer_call_fn_6546
5__inference_batch_normalization_11_layer_call_fn_6559´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Þ2Û
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6579
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6613´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ínon_trainable_variables
Îlayers
Ïmetrics
 Ðlayer_regularization_losses
Ñlayer_metrics
Ì	variables
Ítrainable_variables
Îregularization_losses
Ð__call__
+Ñ&call_and_return_all_conditional_losses
'Ñ"call_and_return_conditional_losses"
_generic_user_object
Ö2Ó
,__inference_activation_11_layer_call_fn_6618¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ñ2î
G__inference_activation_11_layer_call_and_return_conditional_losses_6623¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ònon_trainable_variables
Ólayers
Ômetrics
 Õlayer_regularization_losses
Ölayer_metrics
Ò	variables
Ótrainable_variables
Ôregularization_losses
×__call__
+Ø&call_and_return_all_conditional_losses
'Ø"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
(__inference_dropout_3_layer_call_fn_6628
(__inference_dropout_3_layer_call_fn_6633´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ä2Á
C__inference_dropout_3_layer_call_and_return_conditional_losses_6638
C__inference_dropout_3_layer_call_and_return_conditional_losses_6650´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
:
 2	pi/kernel
: 2pi/bias
0
Ù0
Ú1"
trackable_list_wrapper
0
Ù0
Ú1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
×non_trainable_variables
Ølayers
Ùmetrics
 Úlayer_regularization_losses
Ûlayer_metrics
Û	variables
Ütrainable_variables
Ýregularization_losses
ß__call__
+à&call_and_return_all_conditional_losses
'à"call_and_return_conditional_losses"
_generic_user_object
Ë2È
!__inference_pi_layer_call_fn_6659¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
æ2ã
<__inference_pi_layer_call_and_return_conditional_losses_6670¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
:	2v/kernel
:2v/bias
0
á0
â1"
trackable_list_wrapper
0
á0
â1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ünon_trainable_variables
Ýlayers
Þmetrics
 ßlayer_regularization_losses
àlayer_metrics
ã	variables
ätrainable_variables
åregularization_losses
ç__call__
+è&call_and_return_all_conditional_losses
'è"call_and_return_conditional_losses"
_generic_user_object
Ê2Ç
 __inference_v_layer_call_fn_6679¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
å2â
;__inference_v_layer_call_and_return_conditional_losses_6690¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
|
?0
@1
W2
X3
o4
p5
6
7
¥8
¦9
Ä10
Å11"
trackable_list_wrapper
Ö
0
1
2
3
4
5
6
7
8
 9
!10
"11
#12
$13
%14
&15
'16
(17
)18
*19
+20
,21
-22
.23"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
?0
@1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
W0
X1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
o0
p1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
¥0
¦1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
Ä0
Å1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.:,2Adam/conv2d_4/kernel/m
.:,2"Adam/batch_normalization_6/gamma/m
-:+2!Adam/batch_normalization_6/beta/m
.:,2Adam/conv2d_5/kernel/m
.:,2"Adam/batch_normalization_7/gamma/m
-:+2!Adam/batch_normalization_7/beta/m
.:,2Adam/conv2d_6/kernel/m
.:,2"Adam/batch_normalization_8/gamma/m
-:+2!Adam/batch_normalization_8/beta/m
.:,2Adam/conv2d_7/kernel/m
.:,2"Adam/batch_normalization_9/gamma/m
-:+2!Adam/batch_normalization_9/beta/m
':%
À2Adam/dense_2/kernel/m
0:.2#Adam/batch_normalization_10/gamma/m
/:-2"Adam/batch_normalization_10/beta/m
':%
2Adam/dense_3/kernel/m
0:.2#Adam/batch_normalization_11/gamma/m
/:-2"Adam/batch_normalization_11/beta/m
": 
 2Adam/pi/kernel/m
: 2Adam/pi/bias/m
 :	2Adam/v/kernel/m
:2Adam/v/bias/m
.:,2Adam/conv2d_4/kernel/v
.:,2"Adam/batch_normalization_6/gamma/v
-:+2!Adam/batch_normalization_6/beta/v
.:,2Adam/conv2d_5/kernel/v
.:,2"Adam/batch_normalization_7/gamma/v
-:+2!Adam/batch_normalization_7/beta/v
.:,2Adam/conv2d_6/kernel/v
.:,2"Adam/batch_normalization_8/gamma/v
-:+2!Adam/batch_normalization_8/beta/v
.:,2Adam/conv2d_7/kernel/v
.:,2"Adam/batch_normalization_9/gamma/v
-:+2!Adam/batch_normalization_9/beta/v
':%
À2Adam/dense_2/kernel/v
0:.2#Adam/batch_normalization_10/gamma/v
/:-2"Adam/batch_normalization_10/beta/v
':%
2Adam/dense_3/kernel/v
0:.2#Adam/batch_normalization_11/gamma/v
/:-2"Adam/batch_normalization_11/beta/v
": 
 2Adam/pi/kernel/v
: 2Adam/pi/bias/v
 :	2Adam/v/kernel/v
:2Adam/v/bias/v
	J
ConstÈ
__inference___call___3246ª45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ2¢/
(¢%
# 
xÿÿÿÿÿÿÿÿÿ
ª ">;

0ÿÿÿÿÿÿÿÿÿ 

1ÿÿÿÿÿÿÿÿÿ¥
G__inference_activation_10_layer_call_and_return_conditional_losses_6492Z0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 }
,__inference_activation_10_layer_call_fn_6487M0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¥
G__inference_activation_11_layer_call_and_return_conditional_losses_6623Z0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 }
,__inference_activation_11_layer_call_fn_6618M0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ²
F__inference_activation_6_layer_call_and_return_conditional_losses_6119h7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
+__inference_activation_6_layer_call_fn_6114[7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ²
F__inference_activation_7_layer_call_and_return_conditional_losses_6205h7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
+__inference_activation_7_layer_call_fn_6200[7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ²
F__inference_activation_8_layer_call_and_return_conditional_losses_6291h7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
+__inference_activation_8_layer_call_fn_6286[7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ²
F__inference_activation_9_layer_call_and_return_conditional_losses_6377h7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
+__inference_activation_9_layer_call_fn_6372[7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ¼
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6448h¦£¥¤4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ¼
P__inference_batch_normalization_10_layer_call_and_return_conditional_losses_6482h¥¦£¤4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 
5__inference_batch_normalization_10_layer_call_fn_6415[¦£¥¤4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ
5__inference_batch_normalization_10_layer_call_fn_6428[¥¦£¤4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿ¼
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6579hÅÂÄÃ4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ¼
P__inference_batch_normalization_11_layer_call_and_return_conditional_losses_6613hÄÅÂÃ4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 
5__inference_batch_normalization_11_layer_call_fn_6546[ÅÂÄÃ4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ
5__inference_batch_normalization_11_layer_call_fn_6559[ÄÅÂÃ4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿê
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6091=>?@M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 ê
O__inference_batch_normalization_6_layer_call_and_return_conditional_losses_6109=>?@M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Â
4__inference_batch_normalization_6_layer_call_fn_6060=>?@M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÂ
4__inference_batch_normalization_6_layer_call_fn_6073=>?@M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿê
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6177UVWXM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 ê
O__inference_batch_normalization_7_layer_call_and_return_conditional_losses_6195UVWXM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Â
4__inference_batch_normalization_7_layer_call_fn_6146UVWXM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÂ
4__inference_batch_normalization_7_layer_call_fn_6159UVWXM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿê
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6263mnopM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 ê
O__inference_batch_normalization_8_layer_call_and_return_conditional_losses_6281mnopM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Â
4__inference_batch_normalization_8_layer_call_fn_6232mnopM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÂ
4__inference_batch_normalization_8_layer_call_fn_6245mnopM¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿî
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6349M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 î
O__inference_batch_normalization_9_layer_call_and_return_conditional_losses_6367M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "?¢<
52
0+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Æ
4__inference_batch_normalization_9_layer_call_fn_6318M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÆ
4__inference_batch_normalization_9_layer_call_fn_6331M¢J
C¢@
:7
inputs+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p
ª "2/+ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ±
B__inference_conv2d_4_layer_call_and_return_conditional_losses_6047k57¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
'__inference_conv2d_4_layer_call_fn_6040^57¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ±
B__inference_conv2d_5_layer_call_and_return_conditional_losses_6133kM7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
'__inference_conv2d_5_layer_call_fn_6126^M7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ±
B__inference_conv2d_6_layer_call_and_return_conditional_losses_6219ke7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
'__inference_conv2d_6_layer_call_fn_6212^e7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ±
B__inference_conv2d_7_layer_call_and_return_conditional_losses_6305k}7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ
 
'__inference_conv2d_7_layer_call_fn_6298^}7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª " ÿÿÿÿÿÿÿÿÿ£
A__inference_dense_2_layer_call_and_return_conditional_losses_6402^0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿÀ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 {
&__inference_dense_2_layer_call_fn_6395Q0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿÀ
ª "ÿÿÿÿÿÿÿÿÿ£
A__inference_dense_3_layer_call_and_return_conditional_losses_6533^º0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 {
&__inference_dense_3_layer_call_fn_6526Qº0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¥
C__inference_dropout_2_layer_call_and_return_conditional_losses_6507^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ¥
C__inference_dropout_2_layer_call_and_return_conditional_losses_6519^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 }
(__inference_dropout_2_layer_call_fn_6497Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ}
(__inference_dropout_2_layer_call_fn_6502Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿ¥
C__inference_dropout_3_layer_call_and_return_conditional_losses_6638^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ¥
C__inference_dropout_3_layer_call_and_return_conditional_losses_6650^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 }
(__inference_dropout_3_layer_call_fn_6628Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ}
(__inference_dropout_3_layer_call_fn_6633Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿ¨
C__inference_flatten_1_layer_call_and_return_conditional_losses_6388a7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿÀ
 
(__inference_flatten_1_layer_call_fn_6382T7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿÀ
!__inference_internal_grad_fn_7016îÊ¢Æ
¾¢º

 
'$
result_grads_0

result_grads_1

result_grads_2
'$
result_grads_3

result_grads_4

result_grads_5
'$
result_grads_6

result_grads_7

result_grads_8
'$
result_grads_9

result_grads_10

result_grads_11
"
result_grads_12
À

result_grads_13

result_grads_14
"
result_grads_15


result_grads_16

result_grads_17
"
result_grads_18
 

result_grads_19 
!
result_grads_20	

result_grads_21
(%
result_grads_22

result_grads_23

result_grads_24
(%
result_grads_25

result_grads_26

result_grads_27
(%
result_grads_28

result_grads_29

result_grads_30
(%
result_grads_31

result_grads_32

result_grads_33
"
result_grads_34
À

result_grads_35

result_grads_36
"
result_grads_37


result_grads_38

result_grads_39
"
result_grads_40
 

result_grads_41 
!
result_grads_42	

result_grads_43
ª "

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

22

23

24

25

26

27

28

29

30

31

32

33

34
À

35

36

37


38

39

40
 

41 

42	

43
!__inference_internal_grad_fn_7152îÊ¢Æ
¾¢º

 
'$
result_grads_0

result_grads_1

result_grads_2
'$
result_grads_3

result_grads_4

result_grads_5
'$
result_grads_6

result_grads_7

result_grads_8
'$
result_grads_9

result_grads_10

result_grads_11
"
result_grads_12
À

result_grads_13

result_grads_14
"
result_grads_15


result_grads_16

result_grads_17
"
result_grads_18
 

result_grads_19 
!
result_grads_20	

result_grads_21
(%
result_grads_22

result_grads_23

result_grads_24
(%
result_grads_25

result_grads_26

result_grads_27
(%
result_grads_28

result_grads_29

result_grads_30
(%
result_grads_31

result_grads_32

result_grads_33
"
result_grads_34
À

result_grads_35

result_grads_36
"
result_grads_37


result_grads_38

result_grads_39
"
result_grads_40
 

result_grads_41 
!
result_grads_42	

result_grads_43
ª "

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

22

23

24

25

26

27

28

29

30

31

32

33

34
À

35

36

37


38

39

40
 

41 

42	

43
A__inference_model_1_layer_call_and_return_conditional_losses_5475Æ45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ@¢=
6¢3
)&
input_2ÿÿÿÿÿÿÿÿÿ
p 

 
ª "L¢I
B?

0/0ÿÿÿÿÿÿÿÿÿ 

0/1ÿÿÿÿÿÿÿÿÿ
 
A__inference_model_1_layer_call_and_return_conditional_losses_5571Æ45=>?@MUVWXemnop}¥¦£¤ºÄÅÂÃáâÙÚ@¢=
6¢3
)&
input_2ÿÿÿÿÿÿÿÿÿ
p

 
ª "L¢I
B?

0/0ÿÿÿÿÿÿÿÿÿ 

0/1ÿÿÿÿÿÿÿÿÿ
 
A__inference_model_1_layer_call_and_return_conditional_losses_5856Å45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ?¢<
5¢2
(%
inputsÿÿÿÿÿÿÿÿÿ
p 

 
ª "L¢I
B?

0/0ÿÿÿÿÿÿÿÿÿ 

0/1ÿÿÿÿÿÿÿÿÿ
 
A__inference_model_1_layer_call_and_return_conditional_losses_6033Å45=>?@MUVWXemnop}¥¦£¤ºÄÅÂÃáâÙÚ?¢<
5¢2
(%
inputsÿÿÿÿÿÿÿÿÿ
p

 
ª "L¢I
B?

0/0ÿÿÿÿÿÿÿÿÿ 

0/1ÿÿÿÿÿÿÿÿÿ
 ã
&__inference_model_1_layer_call_fn_4902¸45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ@¢=
6¢3
)&
input_2ÿÿÿÿÿÿÿÿÿ
p 

 
ª ">;

0ÿÿÿÿÿÿÿÿÿ 

1ÿÿÿÿÿÿÿÿÿã
&__inference_model_1_layer_call_fn_5379¸45=>?@MUVWXemnop}¥¦£¤ºÄÅÂÃáâÙÚ@¢=
6¢3
)&
input_2ÿÿÿÿÿÿÿÿÿ
p

 
ª ">;

0ÿÿÿÿÿÿÿÿÿ 

1ÿÿÿÿÿÿÿÿÿâ
&__inference_model_1_layer_call_fn_5646·45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ?¢<
5¢2
(%
inputsÿÿÿÿÿÿÿÿÿ
p 

 
ª ">;

0ÿÿÿÿÿÿÿÿÿ 

1ÿÿÿÿÿÿÿÿÿâ
&__inference_model_1_layer_call_fn_5721·45=>?@MUVWXemnop}¥¦£¤ºÄÅÂÃáâÙÚ?¢<
5¢2
(%
inputsÿÿÿÿÿÿÿÿÿ
p

 
ª ">;

0ÿÿÿÿÿÿÿÿÿ 

1ÿÿÿÿÿÿÿÿÿ 
<__inference_pi_layer_call_and_return_conditional_losses_6670`ÙÚ0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ 
 x
!__inference_pi_layer_call_fn_6659SÙÚ0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ ª
 __inference_reset_optimizer_3376Yáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ¢
¢

options 
ª " 
 __inference_save_checkpoint_3533]45=>?@MUVWXemnop}£¤¥¦ºÂÃÄÅÙÚáâ¢
¢


path 
ª " ü
"__inference_signature_wrapper_2677Õ45=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚ7¢4
¢ 
-ª*
(
x# 
xÿÿÿÿÿÿÿÿÿ"dªa
/
output_0# 
output_0ÿÿÿÿÿÿÿÿÿ 
.
output_1"
output_1ÿÿÿÿÿÿÿÿÿ
"__inference_signature_wrapper_2856ó5=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚá÷âøãùäúåûæüçýèþéÿêëìíîïðñòóôõöz¢w
¢ 
pªm
#
pi
piÿÿÿÿÿÿÿÿÿ 

v
vÿÿÿÿÿÿÿÿÿ
(
x# 
xÿÿÿÿÿÿÿÿÿ"`ª]

output_0
output_0 

output_1
output_1 

output_2
output_2 ½
"__inference_signature_wrapper_293965=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚz¢w
¢ 
pªm
#
pi
piÿÿÿÿÿÿÿÿÿ 

v
vÿÿÿÿÿÿÿÿÿ
(
x# 
xÿÿÿÿÿÿÿÿÿ"`ª]

output_0
output_0 

output_1
output_1 

output_2
output_2 §
"__inference_signature_wrapper_301445=>?@MUVWXemnop}£¤¥¦ºÂÃÄÅÙÚáâ$¢!
¢ 
ª

path

path ""ª

output_0
output_0 Ò
"__inference_signature_wrapper_3111«Yáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ*¢'
¢ 
 ª

options
options ""ª

output_0
output_0 Ê
__inference_train_step_4028ª5=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚá÷âøãùäúåûæüçýèþéÿêëìíîïðñòóôõöj¢g
`¢]
# 
xÿÿÿÿÿÿÿÿÿ

piÿÿÿÿÿÿÿÿÿ 

vÿÿÿÿÿÿÿÿÿ
ª "'¢$


0 


1 


2 
;__inference_v_layer_call_and_return_conditional_losses_6690_áâ0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 v
 __inference_v_layer_call_fn_6679Ráâ0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿð
__inference_validate_step_4179Í65=>?@MUVWXemnop}¦£¥¤ºÅÂÄÃáâÙÚj¢g
`¢]
# 
xÿÿÿÿÿÿÿÿÿ

piÿÿÿÿÿÿÿÿÿ 

vÿÿÿÿÿÿÿÿÿ
ª "'¢$


0 


1 


2 