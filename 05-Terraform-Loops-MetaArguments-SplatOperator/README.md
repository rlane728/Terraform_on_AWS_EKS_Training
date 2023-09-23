## MY NOTES
### PAY ATTENTION:  AWS DATA SOURCES

It is important to note here that AWS has two <i>very</i> similarly named datasources, those being:
- aws_ec2_instance_type_<i>offering</i>: (id) (instance_<i>type</i>)
- aws_ec2_instance_type_<i>offerings</i>: (id) (instance_<i>types</i>) (locations) (location_types)

The similarity in both names and outputs for these data sources can lead to significant confusion if you mistake one for the other.
I reached nearly the end of this section, then was thrown into an existential crisis when I realized I was pulling ".instance_types"
from an object that doesn't return "instance_types".  My code (the instructor's code) was working correctly, but it shouldn't have been?

I had to go back to the start, breaking down my outputs line by line.  I poured over terraform documentation and found nothing.
I asked chatGPT to explain to me where "instance_types" was coming from and chatGPT told me it was coming from inside me.  I called
chatGPT a liar and vowed to never worship it again.

In the end, it turned out that I was referencing the documentation for the "<i>offering</i>" data source, which indeed does NOT
return "instance_types".  However the code was referencing the "<i>offerings</i>" datasource, which does.  So the problem was my brain
couldn't bridge the gap between the working code and the seemingly wrong reference material.  Once I'd figured it out, everything fell into place.

