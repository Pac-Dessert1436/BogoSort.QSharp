namespace Main {
    open BogoSort;

    function MakeReverseArray(length : Int) : Int[] {
        mutable array = [];
        for i in 0..(length - 1) {
            set array += [length - i];
        }
        return array;
    }

    operation MakeRandomArray(length : Int) : Int[] {
        return Shuffle(MakeReverseArray(length));
    }

    operation Main() : Unit {
        let count = 8;
        let revArr = MakeReverseArray(count);
        let res1 = PerformBogoSort(revArr);
        Message($"Reverse Array: {revArr} (Took {res1} times to sort)");
        let randArr = MakeRandomArray(count);
        let res2 = PerformBogoSort(randArr);
        Message($"Random Array: {randArr} (Took {res2} times to sort)");
    }
}