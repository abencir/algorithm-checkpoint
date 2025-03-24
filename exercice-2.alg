ALGORITHM SumOfDistinctElements
VAR
    set1, set2: ARRAY_OF INTEGER;
    sum, i, j: INTEGER;
    isDistinct: BOOLEAN;
BEGIN
    set1 := [3, 1, 7, 9];
    set2 := [2, 4, 1, 9, 3];
    sum := 0;

    FOR i := 0 TO LENGTH(set1) - 1 DO
        isDistinct := TRUE;
        FOR j := 0 TO LENGTH(set2) - 1 DO
            IF set1[i] = set2[j] THEN
                isDistinct := FALSE;
                BREAK;
            END_IF
        END_FOR
        IF isDistinct THEN
            sum := sum + set1[i];
        END_IF
    END_FOR

    FOR i := 0 TO LENGTH(set2) - 1 DO
        isDistinct := TRUE;
        FOR j := 0 TO LENGTH(set1) - 1 DO
            IF set2[i] = set1[j] THEN
                isDistinct := FALSE;
                BREAK;
            END_IF
        END_FOR
        IF isDistinct THEN
            sum := sum + set2[i];
        END_IF
    END_FOR

    Write("Sum of distinct elements: ", sum);
END

PROCEDURE dot_product(VAR v1, v2: ARRAY_OF INTEGER; VAR ps: INTEGER)
VAR
    i: INTEGER;
BEGIN
    ps := 0;
    FOR i := 0 TO LENGTH(v1) - 1 DO
        ps := ps + (v1[i] * v2[i]);
    END_FOR
END

ALGORITHM CheckOrthogonality
VAR
    n, i, ps: INTEGER;
    v1, v2: ARRAY_OF INTEGER;
BEGIN
    Write("Enter the number of vector pairs: ");
    Read(n);

    FOR i := 1 TO n DO
        Write("Enter vector pair ", i, ":");
        Read(v1, v2);

        dot_product(v1, v2, ps);

        IF ps = 0 THEN
            Write("Vectors are orthogonal.");
        ELSE
            Write("Vectors are not orthogonal.");
        END_IF
    END_FOR
END

FUNCTION dot_product_func(v1, v2: ARRAY_OF INTEGER): INTEGER
VAR
    i, ps: INTEGER;
BEGIN
    ps := 0;
    FOR i := 0 TO LENGTH(v1) - 1 DO
        ps := ps + (v1[i] * v2[i]);
    END_FOR
    RETURN ps;
END

ALGORITHM CheckOrthogonalityWithFunction
VAR
    n, i, ps: INTEGER;
    v1, v2: ARRAY_OF INTEGER;
BEGIN
    Write("Enter the number of vector pairs: ");
    Read(n);

    FOR i := 1 TO n DO
        Write("Enter vector pair ", i, ":");
        Read(v1, v2);

        ps := dot_product_func(v1, v2);

        IF ps = 0 THEN
            Write("Vectors are orthogonal.");
        ELSE
            Write("Vectors are not orthogonal.");
        END_IF
    END_FOR
END