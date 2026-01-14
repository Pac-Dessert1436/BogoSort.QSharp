namespace BogoSort {
    import Std.Arrays.IsSorted;
    import Std.Convert.ResultArrayAsInt;
    import Std.Math.BitSizeI;

    operation RandomBit() : Result {
        use q : Qubit = Qubit();
        H(q);
        let result = M(q);
        Reset(q);
        return result;
    }

    operation Shuffle<'T>(array : 'T[]) : 'T[] {
        mutable array : 'T[] = array;
        for i in 0..(Length(array) - 1) {
            let k = RandomInt(0, Length(array) - 1);
            let temp = array[k];
            set array[k] = array[i];
            set array[i] = temp;
        }
        return array;
    }

    operation RandomInt(min : Int, max : Int) : Int {
        mutable bits : Result[] = [];
        let nBits : Int = BitSizeI(max);
        for idxBit in 1..nBits {
            set bits += [RandomBit()];
        }
        let sample = ResultArrayAsInt(bits);
        return sample > max or sample < min ? RandomInt(min, max) | sample;
    }

    operation PerformBogoSort(array : Int[]) : Int {
        mutable array : Int[] = array;
        mutable times : Int = 0;
        while not IsSorted((a, b) -> a < b, array) {
            set array = Shuffle(array);
            set times += 1;
        }
        Message($"- Sorted Array: {array}");
        return times;
    }

    export PerformBogoSort;
}
