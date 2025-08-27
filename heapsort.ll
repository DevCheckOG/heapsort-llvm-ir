@first_format = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@second_format = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

@unsorted_format = private unnamed_addr constant [18 x i8] c"Unsorted array: \0A\00", align 1
@sorted_format = private unnamed_addr constant [16 x i8] c"Sorted array: \0A\00", align 1

@unsorted_array_data = private unnamed_addr constant [6 x i32] [i32 1, i32 12, i32 9, i32 5, i32 6, i32 10], align 4

define void @swap(ptr %0, ptr %1) {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  store ptr %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 4
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %5, align 4
  %8 = load ptr, ptr %4, align 4
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %3, align 4
  store i32 %9, ptr %10, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %4, align 4
  store i32 %11, ptr %12, align 4
  ret void
}

define void @heapify(ptr %0, i32 %1, i32 %2) {
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %6, align 4
  %12 = mul nsw i32 2, %11
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %8, align 4
  %14 = load i32, ptr %6, align 4
  %15 = mul nsw i32 2, %14
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %34

20:                                             
  %21 = load ptr, ptr %4, align 4
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %21, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load ptr, ptr %4, align 4
  %27 = load i32, ptr %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %26, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %25, %30
  br i1 %31, label %32, label %34

32:                                       
  %33 = load i32, ptr %8, align 4
  store i32 %33, ptr %7, align 4
  br label %34

34:                                            
  %35 = load i32, ptr %9, align 4
  %36 = load i32, ptr %5, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %52

38:                                             
  %39 = load ptr, ptr %4, align 4
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %39, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load ptr, ptr %4, align 4
  %45 = load i32, ptr %7, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp sgt i32 %43, %48
  br i1 %49, label %50, label %52

50:                                              
  %51 = load i32, ptr %9, align 4
  store i32 %51, ptr %7, align 4
  br label %52

52:                                               
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %6, align 4
  %55 = icmp ne i32 %53, %54
  br i1 %55, label %56, label %68

56:                                        
  %57 = load ptr, ptr %4, align 4
  %58 = load i32, ptr %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load ptr, ptr %4, align 4
  %62 = load i32, ptr %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %61, i64 %63
  call void @swap(ptr %60, ptr %64)
  %65 = load ptr, ptr %4, align 4
  %66 = load i32, ptr %5, align 4
  %67 = load i32, ptr %7, align 4
  call void @heapify(ptr %65, i32 %66, i32 %67)
  br label %68

68:                                              
  ret void
}

define dso_local void @heapSort(ptr %0, i32 %1)  {
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = sdiv i32 %7, 2
  %9 = sub nsw i32 %8, 1
  store i32 %9, ptr %5, align 4
  br label %10

10:                                            
  %11 = load i32, ptr %5, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %20

13:                                            
  %14 = load ptr, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  call void @heapify(ptr %14, i32 %15, i32 %16)
  br label %17

17:                                         
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, ptr %5, align 4
  br label %10

20:                                              
  %21 = load i32, ptr %4, align 4
  %22 = sub nsw i32 %21, 1
  store i32 %22, ptr %6, align 4
  br label %23

23:                                              
  %24 = load i32, ptr %6, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %38

26:                                               
  %27 = load ptr, ptr %3, align 4
  %28 = getelementptr inbounds i32, ptr %27, i64 0
  %29 = load ptr, ptr %3, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  call void @swap(ptr %28, ptr %32)
  %33 = load ptr, ptr %3, align 4
  %34 = load i32, ptr %6, align 4
  call void @heapify(ptr %33, i32 %34, i32 0)
  br label %35

35:                                              
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, ptr %6, align 4
  br label %23

38:                                             
  ret void
}

define dso_local void @printArray(ptr %0, i32 %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                             
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                              
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr @first_format, i32 %15)
  br label %17

17:                                             
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %6

20:                                               
  %21 = call i32 (ptr, ...) @printf(ptr @second_format)
  ret void
}

declare i32 @printf(ptr, ...)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1)

define i32 @main() {
  %1 = alloca [6 x i32], align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 @unsorted_array_data, i64 24, i1 false)
  %3 = call i32 (ptr, ...) @printf(ptr @unsorted_format)
  %4 = getelementptr inbounds [6 x i32], ptr %1, i64 0, i64 0
  call void @printArray(ptr %4, i32 6)
  %5 = getelementptr inbounds [6 x i32], ptr %1, i64 0, i64 0
  call void @heapSort(ptr %5, i32 6)
  %6 = call i32 (ptr, ...) @printf(ptr @sorted_format)
  %7 = getelementptr inbounds [6 x i32], ptr %1, i64 0, i64 0
  call void @printArray(ptr %7, i32 6)
  ret i32 0
}
