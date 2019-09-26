=begin
#SCORM Cloud Rest API

#REST API used for SCORM Cloud integrations.

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module RusticiSoftwareCloudV2

  class CreatePrivateInvitationSchema
    # The id of the course for which to create an invitation.
    attr_accessor :course_id

    # The email of the user who is creating the invitation.
    attr_accessor :creating_user_email

    attr_accessor :invitation_email

    # Specifies a URL for which to post activity and status data in real time as the course is completed
    attr_accessor :post_back

    # The date this invitation will expire and can not be launched (formatted yyyyMMddHHmmss in UTC time).
    attr_accessor :expiration_date

    # Optional tags to be applied to this invitation.
    attr_accessor :tags


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'course_id' => :'courseId',
        :'creating_user_email' => :'creatingUserEmail',
        :'invitation_email' => :'invitationEmail',
        :'post_back' => :'postBack',
        :'expiration_date' => :'expirationDate',
        :'tags' => :'tags'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'course_id' => :'String',
        :'creating_user_email' => :'String',
        :'invitation_email' => :'InvitationEmailSchema',
        :'post_back' => :'PostBackSchema',
        :'expiration_date' => :'DateTime',
        :'tags' => :'Array<String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'courseId')
        self.course_id = attributes[:'courseId']
      end

      if attributes.has_key?(:'creatingUserEmail')
        self.creating_user_email = attributes[:'creatingUserEmail']
      end

      if attributes.has_key?(:'invitationEmail')
        self.invitation_email = attributes[:'invitationEmail']
      end

      if attributes.has_key?(:'postBack')
        self.post_back = attributes[:'postBack']
      end

      if attributes.has_key?(:'expirationDate')
        self.expiration_date = attributes[:'expirationDate']
      end

      if attributes.has_key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @course_id.nil?
        invalid_properties.push("invalid value for 'course_id', course_id cannot be nil.")
      end

      if @creating_user_email.nil?
        invalid_properties.push("invalid value for 'creating_user_email', creating_user_email cannot be nil.")
      end

      if @invitation_email.nil?
        invalid_properties.push("invalid value for 'invitation_email', invitation_email cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @course_id.nil?
      return false if @creating_user_email.nil?
      return false if @invitation_email.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          course_id == o.course_id &&
          creating_user_email == o.creating_user_email &&
          invitation_email == o.invitation_email &&
          post_back == o.post_back &&
          expiration_date == o.expiration_date &&
          tags == o.tags
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [course_id, creating_user_email, invitation_email, post_back, expiration_date, tags].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = RusticiSoftwareCloudV2.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
