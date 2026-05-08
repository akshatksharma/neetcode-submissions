struct Value {
    let ts: Int
    let value: String
}

class TimeMap { 
    private var map: [String: [Value]]

    init() {
        self.map = [String: [Value]]()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append(Value(ts: timestamp, value: value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = map[key] else { return "" }

        var lo = 0
        var hi = values.count

        while lo < hi {
            let mid = (lo + hi) / 2

            // 4 5 6 7 9    looking for 7   
            // 4 5 6 7 9    looking for 8   
            // 4 5 6 7 9    looking for 10    

            if values[mid].ts <= timestamp {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        // lo/hi will be the last ts <= timestamp
        let targetIdx = lo - 1

        if targetIdx >= 0 {
            return values[targetIdx].value
        } else {
            return ""
        }
    }


    /*
        store multiple of a key at different timestamps
        retriving timestamps
            we want the most recent (i.e greatest) timestamp that's less
            than the passed in tiemstamp

        questions
        - timestamps into set are increasing right? no duplicates

        approach
        - set: hashmap of arrays of tuples
            O(1)
        - get: binary search
            its not like we know exactly what key we want ... 

            because timestamps are strictly increasing, and we know we want the
            largest timestamp under the passed in one ... we can use binary search
            and find the timestamp that's just under the passed in one

            O(logn)
    */
}
