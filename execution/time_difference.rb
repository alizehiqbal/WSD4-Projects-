def my_min_1(arr)

  (0...arr.length).each do |idx1|
    if arr.all?{|el| el>=arr[idx1] }
      return arr[idx1]
    end
  end
  nil
end

def my_min_2(arr)

  min = arr[0]
  arr.each do |el|
    min = el if el<min
  end
  min

end

def subarray_1(arr)
  big = []
  (0...arr.length).each do |idx|
    smol = []
    smol<<arr[idx]
    big<<smol.dup
    (idx+1...arr.length).each do |idx2|
      smol<<arr[idx2]
      big<<smol.dup
    end
  end
  max_sum = big[0].reduce(:+)
  big.each do |array|
    if array.reduce(:+)>max_sum
      max_sum = array.reduce(:+)
    end
  end
  max_sum

end

def subarray_2(arr)
  max_sum = 0
  temp_sum = 0
  max_temp_sum = 0
  i = 0
  while i<arr.length
    temp_sum+=arr[i]
    max_temp_sum=temp_sum if temp_sum>max_temp_sum
    if temp_sum<0
      max_sum = max_temp_sum if max_temp_sum>max_sum
      temp_sum = 0
      max_temp_sum = 0
    end
    i+=1
  end
  max_sum
end

def first_anagram(str1, str2)
  arr = str1.chars
  perm_nums = (1..arr.length).inject(:*) || 1
  perms = []
  until perms.length == perm_nums
    temp = arr.shuffle.join
    perms<<temp unless perms.include?(temp)
  end
  perms.include?(str2)
end
