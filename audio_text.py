import speech_recognition as sr
import subprocess
# Initialize the recognizer 
command = 'ffmpeg -i video2.mp4 -ab 160k -ar 44100 -vn audio.wav'
subprocess.call(command, shell=True)

r = sr.Recognizer()

# Function to transcribe audio in chunks
def transcribe_audio(input_file, output_file):
    try:
        # Use the audio file as the source for input
        with sr.AudioFile(input_file) as source:
            
            # Adjust the recognizer sensitivity to the noise level of the audio file
            r.adjust_for_ambient_noise(source, duration=0.2)
            
            # Duration (in seconds) for each chunk of audio to process
            audio_length = source.DURATION  # Total duration of the audio file
            chunk_duration = 30  # Processing 30-second chunks at a time
            
            with open(output_file, "w") as f:
                for i in range(0, int(audio_length), chunk_duration):
                    audio_chunk = r.record(source, duration=chunk_duration)
                    
                    try:
                        MyText = r.recognize_google(audio_chunk)
                        MyText = MyText.lower()
                        
                        print("Chunk {}: {}".format(i // chunk_duration + 1, MyText))
                        f.write(MyText + " ")
                    
                    except sr.UnknownValueError:
                        print("Unknown value error in chunk {}".format(i // chunk_duration + 1))
                        f.write("[Unrecognized speech in this chunk]\n")
                    except sr.RequestError as e:
                        print("Could not request results in chunk {}; {0}".format(i // chunk_duration + 1, e))
                        f.write("[Error processing this chunk]\n")

    except Exception as e:
        print(f"Error processing audio file: {e}")

# Load the audio file
input_file = "audio.wav" 
output_file = "output_text.txt"

transcribe_audio(input_file, output_file)
