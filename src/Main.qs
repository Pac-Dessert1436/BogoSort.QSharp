namespace Main {
    open BogoSort;

    function MakeReverseArray(length : Int) : Int[] {
        mutable array : Int[] = [];
        for i in 0..(length - 1) {
            set array += [length - i];
        }
        return array;
    }

    operation MakeRandomArray(length : Int) : Int[] {
        return Shuffle(MakeReverseArray(length));
    }

    @EntryPoint()
    operation Main() : Unit {
        let count : Int = 8;
        let revArr : Int[] = MakeReverseArray(count);
        let res1 : Int = PerformBogoSort(revArr);
        Message($"Reverse Array: {revArr} (Took {res1} times to sort)");
        let randArr : Int[] = MakeRandomArray(count);
        let res2 : Int = PerformBogoSort(randArr);
        Message($"Random Array: {randArr} (Took {res2} times to sort)");
    }
}
