class CodeMaster
  attr_reader :secret_code, :name

  def initialize(name)
    @secret_code = []
    @name = name
    @choices = ['red', 'green', 'blue', 'yellow']
  end

  def generate_secret_code
    permutations = @choices
    permutations = permutations.permutation(4).to_a.concat(permutations.repeated_permutation(4).to_a)
    @secret_code = permutations[rand(permutations.length) - 1]
  end
end


