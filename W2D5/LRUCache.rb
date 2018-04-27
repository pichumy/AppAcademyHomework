class LRUCache
    def initialize
      @cache = []
    end

    def count
      @cache.length
      # returns number of elements currently in cache
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
      end
      if self.count == 4
        @cache.shift
      end
      @cache.push(el)
      # adds element to cache according to LRU principle
    end

    def show
      p @cache
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end
