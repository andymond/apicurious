module ServiceHelpers
  private
    def get_json(url)
      response = @conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
