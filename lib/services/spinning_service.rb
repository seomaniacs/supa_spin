require 'content_spinning'

class SpinningService
  def initialize(text, max_count=0, max_characters=0)
    @text      = text
    @max_count = max_count
    @max_characters = max_characters
  end

  def spin
    results = ContentSpinning.spin(@text.clone)
    reduce_results(format_results(results))
  end

private

  def format_result(result)
    {
      text:             result,
      characters_count: result.size
    }
  end

  def format_results(results)
    results.map { |result| format_result(result) }
  end

  def reduce_results(formatted_results)
    reduce_results_by_results_number(reduce_results_by_results_characters_count(formatted_results))
  end

  def reduce_results_by_results_number(formatted_results)
    formatted_results = formatted_results.slice(0, @max_count) if @max_count > 0
    formatted_results
  end

  def reduce_results_by_results_characters_count(formatted_results)
    if @max_characters > 0
      formatted_results = formatted_results.select { |result| result[:characters_count] <= @max_characters }
    end

    formatted_results
  end
end
