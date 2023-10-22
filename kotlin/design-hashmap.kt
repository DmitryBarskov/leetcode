// https://leetcode.com/problems/design-hashmap/submissions/
open class RealHashMap<K, V>(private val capacity: Int) {
    val array = Array<MutableList<Pair<K, V>>>(capacity) { mutableListOf() }

    fun put(key: K, value: V) {
        chunk(key).run {
            val keyIndex = indexOfFirst { it.first == key }
            if (keyIndex == -1) {
                add(Pair(key, value))
            } else {
                this[keyIndex] = Pair(key, value)
            }
        }
    }

    open fun get(key: K): V? = chunk(key).find { it.first == key }?.second

    fun remove(key: K) {
        chunk(key).removeAll { it.first == key }
    }

    private fun chunk(key: K): MutableList<Pair<K, V>> = array[key.hashCode() % capacity]
}

class MyHashMap : RealHashMap<Int, Int>(1024) {
    override fun get(key: Int): Int = super.get(key) ?: -1
}
