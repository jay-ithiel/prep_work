def nearest_larger(arr, idx)

  current_val = arr[idx]
  neighbor_idx = 1
  nearest_large = nil

  while nearest_large == nil do
    left_idx, right_idx = idx - neighbor_idx, idx + neighbor_idx
    left, right = arr[left_idx], arr[right_idx]
    left = nil if left_idx < 0

    break if left == nil && right == nil

    nearest_large ||= left_idx if larger?(current_val, left)
    nearest_large ||= right_idx if larger?(current_val, right)

    neighbor_idx+=1
  end

  nearest_large
end


def larger?(current_val, neighbor_val)
  return false if neighbor_val == nil
  neighbor_val > current_val
end
