#!bin/ruby
# Created by Lindsey Anne on 5/3/17
# Note to Professor Kulkarni: This is a mess, I know. Best I could do given my
# time constraints from work.

CHUNK_SIZE = 4 * 1024 # 4KB page size
DATA_FILE_NAME = 'age.txt'

input_file = File.open(DATA_FILE_NAME)
output_file = File.new('sorted_age.txt', 'wb')
str_buffer = ""

input_buffer1 = []
input_buffer2 = []
output_buffer = []

def get_chunk(infile)
  infile.read(CHUNK_SIZE).split(',')
end

def flush_buffers(input_buffer)
  sort_and_write_buffer(input_buffer) if input_buffer.join.size + 1 >= CHUNK_SIZE
  input_buffer.push str_buffer
  merge_sort input_buffer
  write_file input_buffer
  str_buffer = ""
end

def sort_and_write_buffer(input_buffer)
  input_buffer1 = get_chunk.split(',')
  input_buffer2 = get_chunk.split(',')
  sorted_1 = merge_sort(input_buffer1)
  sorted_2 = merge_sort(input_buffer2)
  output_buffer = merge_sort(sorted_1, sorted_2)
  output_file.write(output_buffer.split(','))
end

def merge_sort array
  return array if array.length <= 1
  mid = (array.length / 2).floor
  left = merge_sort(array[0..mid - 1])
  right = merge_sort(lst[mid..array.length])
  merge_arrays(left, right)
end

def merge_arrays(left_half, right_half)
  if left_half.empty?
    right_half
  elsif right_half.empty?
    left_half
  elsif left_half.first < right_half.first
    [left_half.first] + merge(left_half[1..left_half.length], right_half)
  else
    [right_half.first] + merge(left_half, right_half[1..right_half.length])
  end
end

def sort_final_file
  puts merge_sort(File.read('sorted_age.txt').split(','))
end

while chr = input_file.getc
  unless chr == ","
    str_buffer += chr
  else
    flush_buffers(input_buffer1)
  end
end

until input_file.eof?
  input_buffer = get_chunk(input_file)
  output_file.write(merge_sort(input_buffer))
end

4.times do
  output_file.rewind
  input_buffer1 = get_chunk(output_file)
  input_buffer2 = get_chunk(output_file)

  output_buffer = merge_sort(input_buffer1.merge(input_buffer2))
  tempfile.write(output_buffer)
end
