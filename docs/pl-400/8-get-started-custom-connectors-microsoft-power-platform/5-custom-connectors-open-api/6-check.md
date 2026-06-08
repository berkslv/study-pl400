# Check your knowledge

Completed

- 4 minutes

## Answer the following questions to see what you've learned.

1.
You've implemented a custom connector that uses API Key authentication. You want to have it validate the key at connection creation time. What should you do to implement this action?

Configure an OpenAPI extension x-ms-capabilities with the testConnection property configured.

Use a policy template to set the key in the header.

Enable the test connection feature in the custom connector designer.

Include {KEY} placeholder as the key value and the connection designer will replace it with a valid key when creating a connection.

2.
The parameters on one of your custom connector actions vary based on the selected category parameter value. You want users to only see parameters that are valid for a specific category. What should you do to implement this specification?

Use a policy template.

Configure a Dynamic Schema OpenAPI extension.

Configure a Dynamic Values OpenAPI extension.

Use Swagger editor to enter the list of valid parameters that are sorted by category according to OpenAPI specifications.

3.
You want to configure Dynamic Values for a parameter on your custom connector action. What support do you need from the API to allow you to complete this configuration?

API needs to be compliant with OpenAPI specifications.

API needs to include an operation that returns the schema for the parameter.

API needs to include an operation that returns an array of valid values for that parameter.

Nothing, dynamic values only work with an array of values that are specified in the OpenAPI definition.

4.
Which of the following is an alternative option to configure an OpenAPI extension if you donÔÇÖt want to use the Swagger editor?

Configure the extension when you build a Power Automate flow.

Use Microsoft Power Platform command-line tool and the editor of your choice.

Use Solution explorer to configure the extension.

Swagger editor is the only available method of configuring an OpenAPI extension.
