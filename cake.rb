def find_raisins(cake)
  raisins = []
  cake.each_with_index do |row, y|
    row.chars.each_with_index do |char, x|
      raisins << [y, x] if char == 'o'
    end
  end
  raisins
end

def valid_cut?(cake, row_start, row_end, col_start, col_end, memo)
  key = [row_start, row_end, col_start, col_end]
  return memo[key] if memo.key?(key)

  piece = cake[row_start...row_end].map { |row| row[col_start...col_end] }
  memo[key] = piece.join.count('o') == 1
end

def find_cuts(cake, row, col, raisins, current_cut, all_cuts, memo)
  if current_cut.size == raisins.size
    all_cuts << current_cut.clone
    return
  end

  (row...cake.size).each do |row_end|
    (col...cake[0].size).each do |col_end|
      next if row_end <= row || col_end <= col
      if valid_cut?(cake, row, row_end, col, col_end, memo)
        current_cut << [row, row_end, col, col_end]
        new_row, new_col = (col_end == cake[0].size - 1) ? [row_end, 0] : [row, col_end]
        find_cuts(cake, new_row, new_col, raisins, current_cut, all_cuts, memo)
        current_cut.pop
      end
    end
  end
end

def cut_cake(cake)
  raisins = find_raisins(cake)
  return ['Invalid cake'] if raisins.size < 2 || raisins.size > 9

  all_cuts = []
  memo = {}
  find_cuts(cake, 0, 0, raisins, [], all_cuts, memo)

  best_cut = all_cuts.max_by { |cut| cut.first[1] - cut.first[0] }
  best_cut.map do |(row_start, row_end, col_start, col_end)|
    piece = cake[row_start...row_end].map { |row| row[col_start...col_end] }
    piece.join("\n")
  end
end

# Example usage
cake = [
  '.o......',
  '......o.',
  '....o...',
  '..o.....'
]

cut_cake(cake).each { |piece| puts piece; puts "" }
