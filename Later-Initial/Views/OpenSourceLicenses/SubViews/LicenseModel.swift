//
//  LicenseModel.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation

struct License: Identifiable {
	let id = UUID()
	let name: String
	var url: URL?
	var description: [License]?

	static let CachedAsyncImage = License(name: "CachedAsyncImage",
	                                      description: [License(name: """
	                                                            MIT License

	                                                            Copyright (c) 2021 Lorenzo Fiamingo

	                                                            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	                                                            The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	                                                            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	                                                            """,
	                                                            url: URL(string: "https://github.com/lorenzofiamingo/SwiftUI-CachedAsyncImage"))])

	static let FireBase = License(name: "Firebase Acknowledgements (warning: may cause lag)", description: [License(name:
		"""
	APLevelDB
	Created by Adam Preble on 1/23/12.
	Copyright (c) 2012 Adam Preble. All rights reserved.
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
	
	
	Portions of APLevelDB are based on LevelDB-ObjC:
	https:github.com/hoisie/LevelDB-ObjC
	Specifically the SliceFromString/StringFromSlice macros, and the structure of
	the enumeration methods.  License for those potions follows:
	
	Copyright (c) 2011 Pave Labs
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
	
	Abseil
	
																 Apache License
													 Version 2.0, January 2004
												https://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 https://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	
	FImmutableSortedDictionary
	Copyright (c) 2012 Mads Hartmann Jensen
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of
	this software and associated documentation files (the "Software"), to deal in
	the Software without restriction, including without limitation the rights to
	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
	of the Software, and to permit persons to whom the Software is furnished to do
	so, subject to the following conditions:
	
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
	
	
	Firebase
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	
	/* OPENBSD ORIGINAL: lib/libc/net/base64.c */
	
	//  Base64.m
	//
	//  Version 1.1
	//
	//  Created by Nick Lockwood on 12/01/2012.
	//  Copyright (C) 2012 Charcoal Design
	//
	//  Distributed under the permissive zlib License
	//  Get the latest version from here:
	//
	//  https://github.com/nicklockwood/Base64
	//
	//  This software is provided 'as-is', without any express or implied
	//  warranty.  In no event will the authors be held liable for any damages
	//  arising from the use of this software.
	//
	//  Permission is granted to anyone to use this software for any purpose,
	//  including commercial applications, and to alter it and redistribute it
	//  freely, subject to the following restrictions:
	//
	//  1. The origin of this software must not be misrepresented; you must not
	//  claim that you wrote the original software. If you use this software
	//  in a product, an acknowledgment in the product documentation would be
	//  appreciated but is not required.
	//
	//  2. Altered source versions must be plainly marked as such, and must not be
	//  misrepresented as being the original software.
	//
	//  3. This notice may not be removed or altered from any source distribution.
	//
	
	Firestore Encoder
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
		TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
		1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
		2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
		3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
		4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
		5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
		6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
		7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
		8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
		9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
		END OF TERMS AND CONDITIONS
	
		APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
		Copyright [yyyy] [name of copyright owner]
	
		Licensed under the Apache License, Version 2.0 (the "License");
		you may not use this file except in compliance with the License.
		You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
		Unless required by applicable law or agreed to in writing, software
		distributed under the License is distributed on an "AS IS" BASIS,
		WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
		See the License for the specific language governing permissions and
		limitations under the License.
	
	
	
	### Runtime Library Exception to the Apache 2.0 License: ###
	
	
		As an exception, if you use this Software to compile your source code and
		portions of this Software are embedded into the binary product as a result,
		you may redistribute such product without providing attribution as would
		otherwise be required by Sections 4(a), 4(b) and 4(d) of the License.
	
	Google Data Transport
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	
	
	Google Utilities
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	================================================================================
	
	The following copyright from Landon J. Fuller applies to the isAppEncrypted
	function in Environment/third_party/GULAppEnvironmentUtil.m.
	
	Copyright (c) 2017 Landon J. Fuller <landon@landonf.org>
	All rights reserved.
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of
	this software and associated documentation files (the "Software"), to deal in
	the Software without restriction, including without limitation the rights to
	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
	the Software, and to permit persons to whom the Software is furnished to do so,
	subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	
	Comment from
	<a href="http://iphonedevwiki.net/index.php/Crack_prevention">iPhone Dev Wiki
	Crack Prevention</a>: App Store binaries are signed by both their developer
	and Apple. This encrypts the binary so that decryption keys are needed in order
	to make the binary readable. When iOS executes the binary, the decryption keys
	are used to decrypt the binary into a readable state where it is then loaded
	into memory and executed. iOS can tell the encryption status of a binary via the
	cryptid structure member of LC_ENCRYPTION_INFO MachO load command. If cryptid is
	a non-zero value then the binary is encrypted.
	
	'Cracking' works by letting the kernel decrypt the binary then siphoning the
	decrypted data into a new binary file, resigning, and repackaging. This will
	only work on jailbroken devices as codesignature validation has been removed.
	Resigning takes place because while the codesignature doesn't have to be valid
	thanks to the jailbreak, it does have to be in place unless you have AppSync or
	similar to disable codesignature checks.
	
	More information at <a href="http://landonf.org/2009/02/index.html">Landon
	Fuller's blog</a>
	
	
	GTMHTTPServer.m
	Based a little on HTTPServer, part of the CocoaHTTPServer sample code found at
	https://opensource.apple.com/source/HTTPServer/HTTPServer-11/CocoaHTTPServer/
	License for the CocoaHTTPServer sample code:
	
	Software License Agreement (BSD License)
	
	Copyright (c) 2011, Deusty, LLC
	All rights reserved.
	
	Redistribution and use of this software in source and binary forms,
	with or without modification, are permitted provided that the following conditions are met:
	
	* Redistributions of source code must retain the above
	copyright notice, this list of conditions and the
	following disclaimer.
	
	* Neither the name of Deusty nor the names of its
	contributors may be used to endorse or promote products
	derived from this software without specific prior
	written permission of Deusty, LLC.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
	FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
	
	
	Nanopb
	Copyright (c) 2011 Petteri Aimonen <jpa at nanopb.mail.kapsi.fi>
	
	This software is provided 'as-is', without any express or
	implied warranty. In no event will the authors be held liable
	for any damages arising from the use of this software.
	
	Permission is granted to anyone to use this software for any
	purpose, including commercial applications, and to alter it and
	redistribute it freely, subject to the following restrictions:
	
	1. The origin of this software must not be misrepresented; you
	 must not claim that you wrote the original software. If you use
	 this software in a product, an acknowledgment in the product
	 documentation would be appreciated but is not required.
	
	2. Altered source versions must be plainly marked as such, and
	 must not be misrepresented as being the original software.
	
	3. This notice may not be removed or altered from any source
	 distribution.
	
	nlohmann_json
	
	MIT License
	
	Copyright (c) 2013-2020 Niels Lohmann
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
	
	Promises
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	Protocol Buffers
	Copyright 2008, Google Inc.
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are
	met:
	
		* Redistributions of source code must retain the above copyright
	notice, this list of conditions and the following disclaimer.
		* Redistributions in binary form must reproduce the above
	copyright notice, this list of conditions and the following disclaimer
	in the documentation and/or other materials provided with the
	distribution.
		* Neither the name of Google Inc. nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	Code generated by the Protocol Buffer compiler is owned by the owner
	of the input file used when generating it.  This code is not
	standalone and requires a support library to be linked with it.  This
	support library is itself covered by the above license.
	
	SocketRocket
	Copyright 2012 Square Inc.
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
	
	$OpenBSD: base64.c,v 1.5 2006/10/21 09:55:03 otto Exp $
	
	Copyright (c) 1996 by Internet Software Consortium.
	
	Permission to use, copy, modify, and distribute this software for any
	purpose with or without fee is hereby granted, provided that the above
	copyright notice and this permission notice appear in all copies.
	
	THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISCLAIMS
	ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
	OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
	CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
	DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
	PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
	ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
	SOFTWARE.
	
	Portions Copyright (c) 1995 by International Business Machines, Inc.
	
	International Business Machines, Inc. (hereinafter called IBM) grants
	permission under its copyrights to use, copy, modify, and distribute this
	Software with or without fee, provided that the above copyright notice and
	all paragraphs of this notice appear in all copies, and that the name of IBM
	not be used in connection with the marketing of any product incorporating
	the Software or modifications thereof, without specific, written prior
	permission.
	
	To the extent it has a right to do so, IBM grants an immunity from suit
	under its patents, if any, for the use, sale or manufacture of products to
	the extent that such products are used for performing Domain Name System
	dynamic updates in TCP/IP networks by means of the Software.  No immunity is
	granted for any product per se or for any other function of any product.
	
	THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL WARRANTIES,
	INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
	PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY SPECIAL,
	DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER ARISING
	OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE, EVEN
	IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
	
	gRPC
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	gRPC Protos
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	
	gtm_session_fetcher
	
																 Apache License
													 Version 2.0, January 2004
												http://www.apache.org/licenses/
	
	 TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
	
	 1. Definitions.
	
			"License" shall mean the terms and conditions for use, reproduction,
			and distribution as defined by Sections 1 through 9 of this document.
	
			"Licensor" shall mean the copyright owner or entity authorized by
			the copyright owner that is granting the License.
	
			"Legal Entity" shall mean the union of the acting entity and all
			other entities that control, are controlled by, or are under common
			control with that entity. For the purposes of this definition,
			"control" means (i) the power, direct or indirect, to cause the
			direction or management of such entity, whether by contract or
			otherwise, or (ii) ownership of fifty percent (50%) or more of the
			outstanding shares, or (iii) beneficial ownership of such entity.
	
			"You" (or "Your") shall mean an individual or Legal Entity
			exercising permissions granted by this License.
	
			"Source" form shall mean the preferred form for making modifications,
			including but not limited to software source code, documentation
			source, and configuration files.
	
			"Object" form shall mean any form resulting from mechanical
			transformation or translation of a Source form, including but
			not limited to compiled object code, generated documentation,
			and conversions to other media types.
	
			"Work" shall mean the work of authorship, whether in Source or
			Object form, made available under the License, as indicated by a
			copyright notice that is included in or attached to the work
			(an example is provided in the Appendix below).
	
			"Derivative Works" shall mean any work, whether in Source or Object
			form, that is based on (or derived from) the Work and for which the
			editorial revisions, annotations, elaborations, or other modifications
			represent, as a whole, an original work of authorship. For the purposes
			of this License, Derivative Works shall not include works that remain
			separable from, or merely link (or bind by name) to the interfaces of,
			the Work and Derivative Works thereof.
	
			"Contribution" shall mean any work of authorship, including
			the original version of the Work and any modifications or additions
			to that Work or Derivative Works thereof, that is intentionally
			submitted to Licensor for inclusion in the Work by the copyright owner
			or by an individual or Legal Entity authorized to submit on behalf of
			the copyright owner. For the purposes of this definition, "submitted"
			means any form of electronic, verbal, or written communication sent
			to the Licensor or its representatives, including but not limited to
			communication on electronic mailing lists, source code control systems,
			and issue tracking systems that are managed by, or on behalf of, the
			Licensor for the purpose of discussing and improving the Work, but
			excluding communication that is conspicuously marked or otherwise
			designated in writing by the copyright owner as "Not a Contribution."
	
			"Contributor" shall mean Licensor and any individual or Legal Entity
			on behalf of whom a Contribution has been received by Licensor and
			subsequently incorporated within the Work.
	
	 2. Grant of Copyright License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			copyright license to reproduce, prepare Derivative Works of,
			publicly display, publicly perform, sublicense, and distribute the
			Work and such Derivative Works in Source or Object form.
	
	 3. Grant of Patent License. Subject to the terms and conditions of
			this License, each Contributor hereby grants to You a perpetual,
			worldwide, non-exclusive, no-charge, royalty-free, irrevocable
			(except as stated in this section) patent license to make, have made,
			use, offer to sell, sell, import, and otherwise transfer the Work,
			where such license applies only to those patent claims licensable
			by such Contributor that are necessarily infringed by their
			Contribution(s) alone or by combination of their Contribution(s)
			with the Work to which such Contribution(s) was submitted. If You
			institute patent litigation against any entity (including a
			cross-claim or counterclaim in a lawsuit) alleging that the Work
			or a Contribution incorporated within the Work constitutes direct
			or contributory patent infringement, then any patent licenses
			granted to You under this License for that Work shall terminate
			as of the date such litigation is filed.
	
	 4. Redistribution. You may reproduce and distribute copies of the
			Work or Derivative Works thereof in any medium, with or without
			modifications, and in Source or Object form, provided that You
			meet the following conditions:
	
			(a) You must give any other recipients of the Work or
					Derivative Works a copy of this License; and
	
			(b) You must cause any modified files to carry prominent notices
					stating that You changed the files; and
	
			(c) You must retain, in the Source form of any Derivative Works
					that You distribute, all copyright, patent, trademark, and
					attribution notices from the Source form of the Work,
					excluding those notices that do not pertain to any part of
					the Derivative Works; and
	
			(d) If the Work includes a "NOTICE" text file as part of its
					distribution, then any Derivative Works that You distribute must
					include a readable copy of the attribution notices contained
					within such NOTICE file, excluding those notices that do not
					pertain to any part of the Derivative Works, in at least one
					of the following places: within a NOTICE text file distributed
					as part of the Derivative Works; within the Source form or
					documentation, if provided along with the Derivative Works; or,
					within a display generated by the Derivative Works, if and
					wherever such third-party notices normally appear. The contents
					of the NOTICE file are for informational purposes only and
					do not modify the License. You may add Your own attribution
					notices within Derivative Works that You distribute, alongside
					or as an addendum to the NOTICE text from the Work, provided
					that such additional attribution notices cannot be construed
					as modifying the License.
	
			You may add Your own copyright statement to Your modifications and
			may provide additional or different license terms and conditions
			for use, reproduction, or distribution of Your modifications, or
			for any such Derivative Works as a whole, provided Your use,
			reproduction, and distribution of the Work otherwise complies with
			the conditions stated in this License.
	
	 5. Submission of Contributions. Unless You explicitly state otherwise,
			any Contribution intentionally submitted for inclusion in the Work
			by You to the Licensor shall be under the terms and conditions of
			this License, without any additional terms or conditions.
			Notwithstanding the above, nothing herein shall supersede or modify
			the terms of any separate license agreement you may have executed
			with Licensor regarding such Contributions.
	
	 6. Trademarks. This License does not grant permission to use the trade
			names, trademarks, service marks, or product names of the Licensor,
			except as required for reasonable and customary use in describing the
			origin of the Work and reproducing the content of the NOTICE file.
	
	 7. Disclaimer of Warranty. Unless required by applicable law or
			agreed to in writing, Licensor provides the Work (and each
			Contributor provides its Contributions) on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
			implied, including, without limitation, any warranties or conditions
			of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
			PARTICULAR PURPOSE. You are solely responsible for determining the
			appropriateness of using or redistributing the Work and assume any
			risks associated with Your exercise of permissions under this License.
	
	 8. Limitation of Liability. In no event and under no legal theory,
			whether in tort (including negligence), contract, or otherwise,
			unless required by applicable law (such as deliberate and grossly
			negligent acts) or agreed to in writing, shall any Contributor be
			liable to You for damages, including any direct, indirect, special,
			incidental, or consequential damages of any character arising as a
			result of this License or out of the use or inability to use the
			Work (including but not limited to damages for loss of goodwill,
			work stoppage, computer failure or malfunction, or any and all
			other commercial damages or losses), even if such Contributor
			has been advised of the possibility of such damages.
	
	 9. Accepting Warranty or Additional Liability. While redistributing
			the Work or Derivative Works thereof, You may choose to offer,
			and charge a fee for, acceptance of support, warranty, indemnity,
			or other liability obligations and/or rights consistent with this
			License. However, in accepting such obligations, You may act only
			on Your own behalf and on Your sole responsibility, not on behalf
			of any other Contributor, and only if You agree to indemnify,
			defend, and hold each Contributor harmless for any liability
			incurred by, or claims asserted against, such Contributor by reason
			of your accepting any such warranty or additional liability.
	
	 END OF TERMS AND CONDITIONS
	
	 APPENDIX: How to apply the Apache License to your work.
	
			To apply the Apache License to your work, attach the following
			boilerplate notice, with the fields enclosed by brackets "[]"
			replaced with your own identifying information. (Don't include
			the brackets!)  The text should be enclosed in the appropriate
			comment syntax for the file format. We also recommend that a
			file or class name and description of purpose be included on the
			same "printed page" as the copyright notice for easier
			identification within third-party archives.
	
	 Copyright [yyyy] [name of copyright owner]
	
	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at
	
			 http://www.apache.org/licenses/LICENSE-2.0
	
	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
	
	leveldb
	Copyright (c) 2011 The LevelDB Authors. All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are
	met:
	
	 * Redistributions of source code must retain the above copyright
	notice, this list of conditions and the following disclaimer.
	 * Redistributions in binary form must reproduce the above
	copyright notice, this list of conditions and the following disclaimer
	in the documentation and/or other materials provided with the
	distribution.
	 * Neither the name of Google Inc. nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	
	BoringSSL
	BoringSSL is a fork of OpenSSL. As such, large parts of it fall under OpenSSL
	licensing. Files that are completely new have a Google copyright and an ISC
	license. This license is reproduced at the bottom of this file.
	
	Contributors to BoringSSL are required to follow the CLA rules for Chromium:
	https://cla.developers.google.com/clas
	
	Files in third_party/ have their own licenses, as described therein. The MIT
	license, for third_party/fiat, which, unlike other third_party directories, is
	compiled into non-test libraries, is included below.
	
	The OpenSSL toolkit stays under a dual license, i.e. both the conditions of the
	OpenSSL License and the original SSLeay license apply to the toolkit. See below
	for the actual license texts. Actually both licenses are BSD-style Open Source
	licenses. In case of any license issues related to OpenSSL please contact
	openssl-core@openssl.org.
	
	The following are Google-internal bug numbers where explicit permission from
	some authors is recorded for use of their work. (This is purely for our own
	record keeping.)
	27287199
	27287880
	27287883
	
	OpenSSL License
	---------------
	
	/* ====================================================================
	* Copyright (c) 1998-2011 The OpenSSL Project.  All rights reserved.
	*
	* Redistribution and use in source and binary forms, with or without
	* modification, are permitted provided that the following conditions
	* are met:
	*
	* 1. Redistributions of source code must retain the above copyright
	*    notice, this list of conditions and the following disclaimer.
	*
	* 2. Redistributions in binary form must reproduce the above copyright
	*    notice, this list of conditions and the following disclaimer in
	*    the documentation and/or other materials provided with the
	*    distribution.
	*
	* 3. All advertising materials mentioning features or use of this
	*    software must display the following acknowledgment:
	*    "This product includes software developed by the OpenSSL Project
	*    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
	*
	* 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
	*    endorse or promote products derived from this software without
	*    prior written permission. For written permission, please contact
	*    openssl-core@openssl.org.
	*
	* 5. Products derived from this software may not be called "OpenSSL"
	*    nor may "OpenSSL" appear in their names without prior written
	*    permission of the OpenSSL Project.
	*
	* 6. Redistributions of any form whatsoever must retain the following
	*    acknowledgment:
	*    "This product includes software developed by the OpenSSL Project
	*    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
	*
	* THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
	* EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
	* PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
	* ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
	* NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
	* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
	* STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
	* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
	* OF THE POSSIBILITY OF SUCH DAMAGE.
	* ====================================================================
	*
	* This product includes cryptographic software written by Eric Young
	* (eay@cryptsoft.com).  This product includes software written by Tim
	* Hudson (tjh@cryptsoft.com).
	*
	*/
	
	Original SSLeay License
	-----------------------
	
	/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
	* All rights reserved.
	*
	* This package is an SSL implementation written
	* by Eric Young (eay@cryptsoft.com).
	* The implementation was written so as to conform with Netscapes SSL.
	*
	* This library is free for commercial and non-commercial use as long as
	* the following conditions are aheared to.  The following conditions
	* apply to all code found in this distribution, be it the RC4, RSA,
	* lhash, DES, etc., code; not just the SSL code.  The SSL documentation
	* included with this distribution is covered by the same copyright terms
	* except that the holder is Tim Hudson (tjh@cryptsoft.com).
	*
	* Copyright remains Eric Young's, and as such any Copyright notices in
	* the code are not to be removed.
	* If this package is used in a product, Eric Young should be given attribution
	* as the author of the parts of the library used.
	* This can be in the form of a textual message at program startup or
	* in documentation (online or textual) provided with the package.
	*
	* Redistribution and use in source and binary forms, with or without
	* modification, are permitted provided that the following conditions
	* are met:
	* 1. Redistributions of source code must retain the copyright
	*    notice, this list of conditions and the following disclaimer.
	* 2. Redistributions in binary form must reproduce the above copyright
	*    notice, this list of conditions and the following disclaimer in the
	*    documentation and/or other materials provided with the distribution.
	* 3. All advertising materials mentioning features or use of this software
	*    must display the following acknowledgement:
	*    "This product includes cryptographic software written by
	*     Eric Young (eay@cryptsoft.com)"
	*    The word 'cryptographic' can be left out if the rouines from the library
	*    being used are not cryptographic related :-).
	* 4. If you include any Windows specific code (or a derivative thereof) from
	*    the apps directory (application code) you must include an acknowledgement:
	*    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
	*
	* THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
	* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
	* ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
	* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
	* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
	* OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
	* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	* LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
	* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
	* SUCH DAMAGE.
	*
	* The licence and distribution terms for any publically available version or
	* derivative of this code cannot be changed.  i.e. this code cannot simply be
	* copied and put under another distribution licence
	* [including the GNU Public Licence.]
	*/
	
	
	ISC license used for completely new code in BoringSSL:
	
	/* Copyright (c) 2015, Google Inc.
	*
	* Permission to use, copy, modify, and/or distribute this software for any
	* purpose with or without fee is hereby granted, provided that the above
	* copyright notice and this permission notice appear in all copies.
	*
	* THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
	* WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
	* MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
	* SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
	* WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
	* OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
	* CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. */
	
	
	The code in third_party/fiat carries the MIT license:
	
	Copyright (c) 2015-2016 the fiat-crypto authors (see
	https://github.com/mit-plv/fiat-crypto/blob/master/AUTHORS).
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
	
	
	Licenses for support code
	-------------------------
	
	Parts of the TLS test suite are under the Go license. This code is not included
	in BoringSSL (i.e. libcrypto and libssl) when compiled, however, so
	distributing code linked against BoringSSL does not trigger this license:
	
	Copyright (c) 2009 The Go Authors. All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are
	met:
	
	 * Redistributions of source code must retain the above copyright
	notice, this list of conditions and the following disclaimer.
	 * Redistributions in binary form must reproduce the above
	copyright notice, this list of conditions and the following disclaimer
	in the documentation and/or other materials provided with the
	distribution.
	 * Neither the name of Google Inc. nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	
	BoringSSL uses the Chromium test infrastructure to run a continuous build,
	trybots etc. The scripts which manage this, and the script for generating build
	metadata, are under the Chromium license. Distributing code linked against
	BoringSSL does not trigger this license.
	
	Copyright 2015 The Chromium Authors. All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are
	met:
	
	 * Redistributions of source code must retain the above copyright
	notice, this list of conditions and the following disclaimer.
	 * Redistributions in binary form must reproduce the above
	copyright notice, this list of conditions and the following disclaimer
	in the documentation and/or other materials provided with the
	distribution.
	 * Neither the name of Google Inc. nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

	""")])
}
