target triple="x86_64"

%struct.list = type { i64, %struct.list* }
%struct.mystruct = type { double, i32, [10 x i8] }

@globallist = common global %struct.list* null, align 4

define void @tailrecursive(i64 %num)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sle i64 %num, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  ret void
LU4:
  %u5 = sub i64 %num, 1
  call void @tailrecursive(i64 %u5)
  ret void
}

; Number examples
define double @foo(double %a) #0
{
  %1 = fmul double %a, 2.00000e+01    ; Hexadecimal exponent form
  %2 = fadd double %1, 0x7f8a         ; Hexadecimal
  %3 = fdiv double %2, 12.75          ; Float
  ret double %3
}

; Vector, attribute, struct examples
define double @bar(%struct.mystruct* byval nocapture readonly align 8 %a)
{
  vector.body.preheader:
    br label %vector.body
  vector.body:
    %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
    %16 = getelementptr inbounds %struct.mystruct, %struct.mystruct* %a, i64 0, i32 3, i64 %index
    %17 = bitcast i8* %16 to <16 x i8>*
    %wide.load = load <16 x i8>, <16 x i8>* %17, align 8, !tbaa !3
    %index.next = add i64 %index, 32
    %30 = icmp eq i64 %index.next, 64
    br i1 %30, label %exit, label %vector.body, !llvm.loop
  exit:
    ret void
}


define i64 @main()
{
LU51:
  br label %LU52
LU52:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  ret i64 0
}


; Declartion examples
declare i64 @printf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1


; Attributes examples
attributes #0 = { nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" }


; Metadata examples
!llvm.ident = !{!0}
!0 = !{!"clang version 3.7.0 (tags/RELEASE_370/final)"}
!1 = !{!"omnipotent char", !2, i64 0}
!2 = !{!"Simple C/C++ TBAA"}
!3 = !{!1, !1, i64 0}
