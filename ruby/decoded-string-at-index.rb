# frozen_string_literal: true

# https://leetcode.com/problems/decoded-string-at-index/

def chunkify(str)
  first_text, first_reps, *rest = str.split(/(?=\d)|(?<=\d)/)
  rest.reduce(RepeatChunk.new(first_text, first_reps)) do |prev_chunk, token|
    if token.between?('2', '9')
      RepeatChunk.new(prev_chunk, token)
    else
      ConcatChunk.new(prev_chunk, token)
    end
  end
end

class RepeatChunk
  def initialize(chunk, repetitions)
    @chunk = chunk
    @repetitions = (repetitions || 1).to_i
  end

  def size
    @size ||= @chunk.size * @repetitions
  end

  def [](idx)
    @chunk[idx % @chunk.size]
  end
end

class ConcatChunk
  def initialize(*args)
    @chunk1, @chunk2 = args
  end

  def size
    @size ||= @chunk1.size + @chunk2.size
  end

  def [](idx)
    if idx < @chunk1.size
      @chunk1[idx]
    else
      @chunk2[idx - @chunk1.size]
    end
  end
end

def decode_at_index(s, k) = chunkify(s)[k - 1]
