class Post

  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
    # todo
  end

  def to_string
    # todo
  end

  def save
    file = File.new(file_path, 'w:UTF-8')

    to_string.each {|string| file.puts(string)}
    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

    file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

    "#{current_path}/#{self.class.name}_#{file_time}.txt"
  end
end