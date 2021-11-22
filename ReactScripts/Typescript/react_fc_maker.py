__author__ = 'beto0607'

import sys
import os
import re


def to_camel_case(snake_str):
    components = snake_str.split('_')
    return ''.join(capitalize(x) for x in components[:])


def capitalize(word):
    return word[0].upper() + word[1:]


def slugify(word):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1-\2', word)
    return re.sub('([a-z0-9])([A-Z])', r'\1-\2', s1).lower()


class FunctionalComponentMaker():
    def __init__(self, component_name, path):
        self.component_name = to_camel_case(component_name)
        if 'component' not in self.component_name.lower():
            self.component_name += 'Component'
        self.scss_name = slugify(self.component_name)
        self.path = path
        self.full_path = self.path+self.component_name

    def create_all(self):
        self.mkdir(self.full_path)  # Creates base directory
        self.cd(self.full_path)
        self.mk_scss(self.component_name)
        self.mk_tsx(self.component_name)
        self.mk_test(self.component_name)

    def cd(self, path):
        os.chdir(path)

    def mkdir(self, path):
        os.makedirs(path, exist_ok=True)

    def touch(self, component_name=None, prefix=None, suffix=None, extension=None):
        file_name = '.'.join(
            [x for x in (prefix, component_name, suffix, extension) if x is not None])
        return open(file_name, 'w+')

    def mk_scss(self, component_name):
        file = self.touch(self.scss_name, suffix='module', extension='scss')
        file.writelines(SCSS_MODULE_TEMPLATE.format(
            component_name=component_name))

    def mk_tsx(self, component_name):
        file = self.touch(component_name, extension='tsx')
        file.writelines(TYPESCRIPT_TEMPLATE_CONTENT.format(
            component_name=component_name, scss_name=self.scss_name))

    def mk_test(self, component_name):
        self.mkdir('__tests__')
        self.cd('__tests__')
        file = self.touch(component_name, suffix='test', extension='tsx')
        file.writelines(TEST_TEMPLATE.format(component_name=component_name))


def main():
    component_name = sys.argv[1]
    path = sys.argv[2] if len(sys.argv) >= 3 else './'
    fcm = FunctionalComponentMaker(component_name=component_name, path=path)
    fcm.create_all()


TYPESCRIPT_TEMPLATE_CONTENT = """
/**
 * {component_name} - Code
 * Basic React Functional Component file on Typescript
 * @author beto0607
 * @github https://github.com/beto0607
 */
import React, {{ useState }} from 'react';
import {{ useDispatch, useSelector }} from "react-redux";
import styles from "./{scss_name}";


export interface {component_name}Props {{

}}
export const {component_name}: React.FC<{component_name}Props> = (props: {component_name}Props) => {{
    const [state, setState] = useState(null);
    const dispatcher = useDispatch();
    const appState = useSelector((state: ApplicationState) => state);

    return (<div className={{styles['container']}}>
        <span>{component_name}</span>
    </div>);
}}

"""

SCSS_MODULE_TEMPLATE = """
/**
 * {component_name} - Style
 * Basic React Functional Component style file
 * Using CSS Module format
 * @author beto0607
 * @github https://github.com/beto0607
 */
.container {{
    display: block;
}}

"""

TEST_TEMPLATE = """
/**
 * {component_name} - Test
 * Basic React Functional Component test file on Typescript
 * @author beto0607
 * @github https://github.com/beto0607
 */
import React from 'react';
import {{ shallow }} from 'enzyme';
import {{ {component_name} }} from '../{component_name}';
import toJson from 'enzyme-to-json'

describe('{component_name}', () => {{
    it('renders without crashing', () => {{
        const component = shallow((<{component_name} />));
        expect(toJson(component)).toMatchSnapshot()
    }});
}});

"""


if __name__ == '__main__':
    main()
