require "anthropic"
require "dotenv"
Dotenv.load

model = {   haik: "claude-3-haiku-20240307", 
            sonet: "claude-3-5-sonnet-20240620" 
        }

client = Anthropic::Client.new(access_token: ENV['ANTHROPIC'])

system    = "reply in greek"
question  = "que pasa"

response = client.messages(
  parameters: {
    model: model[:sonet], 
    system: system,
    messages: [
      {"role": "user", "content": question}
    ],
    max_tokens: 1000
  }
)

puts response["content"].first["text"]
puts response

# {"id"=>"msg_01Sa9JTFkKu4fgae8jKLYK56", "type"=>"message", "role"=>"assistant", 
# "model"=>"claude-3-5-sonnet-20240620", 
# "content"=>[{"type"=>"text", "text"=>"Γεια σας! Καταλαβαίνω ότι με ρωτήσατε \"τι γίνεται;\" στα ισπανικά. Δυστυχώς δεν μιλάω ισπανικά, αλλά μπορώ να επικοινωνήσω στα ελληνικά. Ελπίζω να είστε καλά! Αν έχετε κάποια ερώτηση, θα χαρώ να σας βοηθήσω όσο μπορώ στα ελληνικά."}],
#  "stop_reason"=>"end_turn", "stop_sequence"=>nil, 
#  "usage"=>{"input_tokens"=>14, "output_tokens"=>167}}


# def process_your incremental_response, delta
#     puts delta
# end
